
  class Admin::DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :check_superadmin

    def dashboard
      # Controller code for the dashboard
    end

    private

    def check_superadmin
      redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.superadmin?
    end
  end
