class EventsController < ApplicationController

before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    @event.save
  end

  def destroy
    @event.destroy
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :venue_name, :address, :country, :description, :website_url, :purchase_url, :logo, :primary_image, :instagram, :hashtag, :facebook, :twitter, :instagram_api, :start_date, :end_date, :day_description, :start_time, :end_time)
  end
end
