require_relative "application_controller"

module TelehealthPrimEngine
  # Primary controller for authenticated users.
  class AdminsController < ApplicationController
    before_action :authenticate_user!

    def show
    end
  end
end
