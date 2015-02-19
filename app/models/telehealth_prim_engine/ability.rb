module TelehealthPrimEngine
  # Defines User authorizations.
  class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new # guest user (not logged in)

      if user.superuser?
        can :manage, :all
      else
        authorize_researcher if user.researcher?
      end
    end

    private

    def authorize_researcher
      can :read, Participant
    end
  end
end
