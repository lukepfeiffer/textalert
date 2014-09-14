class EventsController < ApplicationController
  def index
    @event = Event.all
    @new_event = Event.new
  end

  def create
    @event = Event.new(events_params)
    if @event.save
      redirect_to events_path
    end
  end

  def events_params
    params.require(:event).permit(
      :title,
      :desc
    )
  end
end
