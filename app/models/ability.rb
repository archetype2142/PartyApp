class Ability
  include CanCan::Ability

  def initialize(admin)
       admin ||= Admin.new # guest user (not logged in)
       if admin
       can :manage, :all
   end
end
end
