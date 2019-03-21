class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sidebar_toggle
    if current_user.sidebar_active
      current_user.update_attribute(:sidebar_active, false)
    else
      current_user.update_attribute(:sidebar_active, true)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new_session_path(scope)
    new_user_session_path
  end
end
