class Admin::DashboardController < Admin::SuperuserController

  def dashboard
    @groups = Group.all.includes(:users, :memberships)
    @events = Event.all.includes(:group, :event_participants)
  end

end
