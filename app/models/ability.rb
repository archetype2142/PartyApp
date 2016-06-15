class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, :all                   
    if user.has_role?(:admin)
      can :access, :rails_admin       
      can :dashboard                                  
      can :manage, :all    
  elsif user.has_role?(:moderator)
    can :access, :rails_admin       
    can :dashboard
    can :manage, [ServiceProvider]
end
end
end
