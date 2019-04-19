class HomeController < ApplicationController
  def show
    if current_user
      @campaigns = Campaign.where(:creator=>current_user.id)
      @users = User.all()
      background_url('back_profile_u.jpg')
      linear_gradient('rgba(0,0,0,.5)', 'rgba(0,0,0,.8)')
      render 'profile/index'
    else
      background_url('back_dashboard.jpg')
      linear_gradient('rgba(0,0,0,.5)', 'rgba(0,0,0,.8)')
      render 'index'
    end
  end

  def index
    background_url('back_dashboard.jpg')
    linear_gradient('rgba(0,0,0,.5)', 'rgba(0,0,0,.8)')
  end
end
