class Users::OmniauthController < ApplicationController
  def sign_in_and_redirect(user)
    session[:user_id] = user.id
    redirect_to root_path
  end
  # facebook callback
  def facebook
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      #set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
      redirect_to "/login"
    end
  end

  # github callback
  def github
    @user = User.create_from_github_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      #set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through Github. Please register or try signing in later.'
      redirect_to "/login"
    end
  end

  # google callback
  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      #set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
      redirect_to "/login"
    end
  end

  # twitter callback
  def twitter
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Twitter') if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through Twitter. Please register or try signing in later.'
      redirect_to "/login"
    end
  end

  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
    redirect_to "/login"
  end
end
