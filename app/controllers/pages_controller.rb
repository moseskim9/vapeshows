class PagesController < ApplicationController
  def home
    @events = Event.all
    @users = User.all
  end

  def about
  end
end
