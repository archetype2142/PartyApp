class Admin < ActiveRecord::Base
	before_filter :authenticate_admin
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :timeoutable, :lockable
end
