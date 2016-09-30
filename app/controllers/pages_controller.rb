class PagesController < ApplicationController
  def home
    @events = Event.all
    @users = User.all
    @reviews = Review.all


    @latest_events = @events.first(3)
    @latest_reviews = @reviews.last(3)
  end

  def about
  end
end
