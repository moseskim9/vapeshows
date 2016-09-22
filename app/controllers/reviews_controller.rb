class ReviewsController < ApplicationController
before_action :find_review, only: [:show, :edit, :update, :destroy]
# before_action :find_event

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @event = Event.find(params[:event_id])
    @review = @event.reviews.new
  end

  def create
    @event = Event.find(params[:event_id])
    @review = @event.reviews.build(review_params)
    if @review.save
      # @event.new_averagerate(@review.rating)
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    @review.save
  end

  def destroy
    @review.destroy
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def review_params
    params.require(:review).permit(:headline, :description, :rating, :date)
  end
end
