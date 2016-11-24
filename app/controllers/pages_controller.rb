class PagesController < ApplicationController
  def home
    @events = Event.all
    @users = User.all
    @reviews = Review.all


    @upcoming_events = Event.where(["start_date > ?", Time.current])
    @sorted = @events.sort_by &:start_date

    @latest_events = @sorted.first(3)
    @latest_reviews = @reviews.last(3)
    @latest_users = @users.last(3)

  end

  def about
  end
end
