class ApplicationController < ActionController::Base
  # before_action :authenticate_request
  # attr_reader :current_user
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

  # private
  #   def authenticate_request
  #     @current_user = AuthorizeApiRequest.call(request.headers).result
  #     render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  #   end
end
