class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  # before_action :event_loc
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def event_loc
      session[:event_id] = params[:event_id]
  end

end
