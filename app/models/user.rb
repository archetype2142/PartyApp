class User < ActiveRecord::Base

	ROLES = %i[admin moderator banned]
	
	def roles=(roles)
		roles = [*roles].map { |r| r.to_sym }
		self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
	end

	def roles
		ROLES.reject do |r|
			((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
		end
	end

	def has_role?(role)
		roles.include?(role)
	end

	def role?(base_role)
		ROLES.index(base_role.to_s) <=> ROLES.index(role)
	end

	def is?(role)
		roles.include?(role.to_s)
	end

	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
		else
			if conditions[:username].nil?
				where(conditions).first
			else
				where(username: conditions[:username]).first
			end
		end
	end
	validate :validate_username

	def validate_username
		if User.where(email: username).exists?
			errors.add(:username, :invalid)
		end
	end
	validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  attr_accessor :login
  def login=(login)
  	@login = login
  end

  def login
  	@login || self.username || self.email
  end
end
