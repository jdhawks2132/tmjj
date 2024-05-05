class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_events, only: [:index]

  def index
  end

  def show
  end

  def new
    @event = Event.new
  end

	def create
		@group = Group.find_by(id: event_params[:group_id])
		if @group.nil?
			redirect_to new_event_path, alert: "Invalid group selected."
			return
		end

	
		@event = @group.events.build(event_params)

		@event.user = current_user
		
		if @event.save
			redirect_to events_path, notice: 'Event was successfully created.'
		else
			redirect_to events_path, alert: 'Failed to create event: ' + @event.errors.full_messages.join(', ') + '.'
		end
	end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

	def add_participant
		@event = Event.find(params[:event_id])
		user = User.find(params[:user_id])
		if @event.group.users.include?(user) && !@event.participants.include?(user)
			@event.participants << user
			redirect_to @event, notice: 'Participant added successfully.'
		else
			redirect_to @event, alert: 'Cannot add participant.'
		end
	end
	
	def remove_participant
		@event = Event.find(params[:event_id])
		user = User.find(params[:user_id])
		if @event.participants.include?(user)
			@event.participants.delete(user)
			redirect_to @event, notice: 'Participant removed successfully.'
		else
			redirect_to @event, alert: 'Cannot remove participant.'
		end
	end

  private

  def set_event
    @event = Event.find(params[:id])
    unless current_user.superadmin? || current_user.groups.include?(@event.group)
      redirect_to root_path, alert: 'Not authorized to view this event.'
    end
  end

  def set_events
    if current_user.superadmin?
      @events = Event.all
    else
      group_ids = current_user.groups.pluck(:id)
      @events = Event.where(group_id: group_ids)
    end
  end

	def event_params
		params.require(:event).permit(:name, :event_type, :street, :city, :state, :zip, :google_maps_link, :phone, :event_date_start, :event_date_end, :group_id, :user_id)
	end
end