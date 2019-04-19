class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_reader :current_user, :background_url

  @background_url = "back_404.jpg"
  @lg1 = "rgba(0,0,0,.5)"
  @lg2 = "rgba(0,0,0,.8)"

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def background_url(url="back_404.jpg")
    @background_url = url
  end

  def linear_gradient(lg1, lg2)
    @lg1 = lg1
    @lg2 = lg2
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
