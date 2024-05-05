class Admin::MembershipsController < Admin::SuperuserController
	def create
		@membership = Membership.new(membership_params)
		if @membership.save
			redirect_to admin_dashboard_path, notice: 'User added to group successfully.'
		else
			redirect_to admin_dashboard_path, alert: 'Failed to add user to group.'
		end
	end
	
	def destroy
		membership = Membership.find(params[:id])
		membership.destroy
		redirect_to admin_dashboard_path, notice: 'User removed from group successfully.'
	end
	
	private
	
	def membership_params
		params.require(:membership).permit(:user_id, :group_id)
	end

end