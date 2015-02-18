# Defines User authorizations.
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    return unless user.superuser?

    can :manage, :all
  end
end
