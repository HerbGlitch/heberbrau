class LoginController < ApplicationController
  def index
    background_url('back_login.jpg')
    linear_gradient('rgba(0,0,0,.5)', 'rgba(0,0,0,.8)')
  end

  def register
    if params[:password] == params[:password_confirmation]
      new_params = {}
      new_params[:email] = params[:email]
      new_params[:password] = params[:password]
      begin
        new_params[:uid] = User.maximum(:id).next
      rescue
        new_params[:uid] = 1
      end
      new_params[:provider] = "site"
      @user = User.register(new_params)
      if @user.persisted?
        puts @user.id
        session[:user_id] = @user.id
        redirect_to root_path
      else
        puts "WHYYYY"
        redirect_to "/login-register"
      end
    else
      redirect_to "/login-register"
    end
  end

  def login
    user = User.find_by(email: params[:email].downcase)
    if user && user.valid_password?(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      # Create an error message.
      puts "error"
      redirect_to "/login"
    end
  end
end
