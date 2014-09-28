class EventsController < ApplicationController
  def index
    @events = Event.all
    @new_event = Event.new
  end

  def create
    @event = Event.new(events_params)
    if @event.save
      redirect_to events_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(events_params)
    redirect_to events_path
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path
  end

  def events_params
    params.require(:event).permit(
      :title,
      :desc,
      :send_at,
      :user_id
    )
  end
end
