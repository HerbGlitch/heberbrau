class HomeController < ApplicationController
  def show
    if current_user
      @campaigns = Campaign.where(:creator=>current_user.id)
      @users = User.all
      render 'profile/index'
    else
      render 'index'
    end
  end

  def index
  end
end
