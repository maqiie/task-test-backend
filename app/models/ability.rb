class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.admin?
      can :manage, :all
    else
      can :read, Post
      can :create, Post
      can :update, Post, user_id: user.id
      can :destroy, Post, user_id: user.id
    end
  end
end
