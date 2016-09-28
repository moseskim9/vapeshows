class EventsController < ApplicationController
before_action :authenticate_user!, :only => [:new]
before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @events = Event.all
    @reviews = @event.reviews
    @events = Event.where.not(latitude: nil, longitude: nil)

        @hash = Gmaps4rails.build_markers(@event) do |event, marker|
          marker.lat event.latitude
          marker.lng event.longitude
          # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
        end
    @event_coordinates = { lat: @event.latitude, lng: @event.longitude }
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      # EventMailer.creation_confirmation(@event).deliver_now
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
    params.require(:event).permit(:name, :venue_name, :address, :country, :description, :website_url, :purchase_url, :logo, :logo_cache, :primary_image, :primary_image_cache, :instagram, :hashtag, :facebook, :twitter, :instagram_api, :start_date, :end_date, :day_description, :start_time, :end_time)
  end
end
