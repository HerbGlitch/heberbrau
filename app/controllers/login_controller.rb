class LoginController < ApplicationController
  def index
  end

  def register
    if params[:password] == params[:password_confirmation]
      new_params = {}
      new_params[:email] = params[:email]
      new_params[:password] = params[:password]
      new_params[:uid] = User.maximum(:id).next
      new_params[:provider] = "site"
      @user = User.register(new_params)
      if @user.persisted?
        puts @user.id
        session[:user_id] = @user.id
        redirect_to root_path
      end
    else
      puts "what?!?!?"
      redirect_to "/login"
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
