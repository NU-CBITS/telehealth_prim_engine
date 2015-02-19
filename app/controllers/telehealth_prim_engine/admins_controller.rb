module TelehealthPrimEngine
  # Primary controller for authenticated users.
  class AdminsController < ApplicationController
    before_action :authenticate_user!

    def show
      authorize! :read, Participant
      @participants = Participant.all
    end
  end
end
