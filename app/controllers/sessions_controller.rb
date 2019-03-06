class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to authenticated_root_path
  end

  def register
    @user = User.register(params.require(:user).permit(:email, :password, :password_confirmation))
    if @user.save
      puts @user.id
      session[:user_id] = @user.id
      redirect_to authenticated_root_path
    else
      puts "what?!?!?"
    end
  end

  def login
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.valid_password?(params[:session][:password])
      session[:user_id] = user.id
      redirect_to authenticated_root_path
    else
      # Create an error message.
      puts "error"
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end
