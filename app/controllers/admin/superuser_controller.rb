class Admin::SuperuserController < ApplicationController
	before_action :authenticate_user!
	before_action :check_superadmin

	private

	def check_superadmin
		redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.superadmin?
	end
end