class ProfileController < ApplicationController
  def index
  end

  def campaigns
    @users = User.all
    @campaigns = Campaign.where(:creator=>current_user.id)
  end

  def campaign
  end

  def create_campaign
    if current_user.campaigns_slot == nil
      current_user.update_attribute(:campaigns_slot, 1)
    else
      current_user.update_attribute(:campaigns_slot, current_user.campaigns_slot + 1)
    end
    @campaign = Campaign.new(name: params[:name], creator: current_user.id, slot: current_user.campaigns_slot)
    if @campaign.save
      redirect_to "/campaigns"
    else
      puts "dang"
    end
  end

  def friend_search
    @users = User.all
  end

  def update_user
    @user = User.find_by(id: current_user.id)
    if(@user)
      if(params[:username] != "" && params[:username] != current_user.username)
        @user.update_attribute(:username, params[:username])
      end
      # if(params[:email] != "" && params[:email] != current_user.email)
      #   @user.update_attribute(:email, params[:email])
      # end
      if(params[:discription] != "" && params[:discription] != current_user.discription)
        @user.update_attribute(:discription, params[:discription])
      end
      redirect_to root_path
    else
      puts("update user broken")
    end
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
