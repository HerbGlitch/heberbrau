class ProfileController < ApplicationController
  def index
  end

  def campaigns
    @users = User.all
  end

  def friend_search
    @users = User.all
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = current_user.following.paginate(page: params[:page])
    render 'show_follow'
  end

def followers
  @title = "Followers"
  @user  = User.find(params[:id])
  @users = current_user.followers.paginate(page: params[:page])
  render 'show_follow'
end
end
