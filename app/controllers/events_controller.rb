class EventsController < ApplicationController
  def index
    # @events = Event.paginate(page: params[:page], order: 'created_at DESC', per_page: 15)
    @events = Event.all
    @new_event = Event.new
  end

  def create
    @event = Event.new(events_params)
    if @event.save
      redirect_to events_path
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path
  end

  def events_params
    params.require(:event).permit(
      :title,
      :desc,
      :send_at
    )
  end
end
