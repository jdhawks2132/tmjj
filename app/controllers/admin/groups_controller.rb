class Admin::GroupsController < Admin::SuperuserController

	def create
		@group = Group.new(group_params)
		if @group.save
			redirect_to admin_dashboard_path, notice: 'Group created successfully.'
		else
			render 'dashboard', status: :unprocessable_entity
		end
	end
	
	private
	
	def group_params
		params.require(:group).permit(:name)
	end

end