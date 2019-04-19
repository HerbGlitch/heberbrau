class ProfileController < ApplicationController
  def index
    background_url('back_profile_u.jpg')
    linear_gradient('rgba(0,0,0,.5)', 'rgba(0,0,0,.8)')
  end

  def profile
    background_url('back_profile_u.jpg')
    linear_gradient('rgba(0,0,0,.5)', 'rgba(0,0,0,.8)')
    @user = User.find_by_id(params[:id])
    @users = User.all()
    @campaigns = Campaign.where(:creator=>@user.id)
  end

  def campaigns
    background_url('back_campaigns.jpg')
    linear_gradient('rgba(0,0,0,.3)', 'rgba(0,0,0,.5)')
    @users = User.all()
    @campaigns = Campaign.where(:creator=>current_user.id)
  end

  def campaign
    @campaign = Campaign.find_by(:creator=>params[:uid], :slot=>params[:id])
    if @campaign.image.url != nil
      background_url(@campaign.image.url)
    else
      background_url('placeholder.jpg')
    end
    linear_gradient('rgba(0,0,0,.5)', 'rgba(0,0,0,.8)')
  end

  def friend_search
    background_url('back_friend_search.jpg')
    linear_gradient('rgba(0,0,0,.3)', 'rgba(0,0,0,.5)')
    @users = User.all()
  end

  def parties
    @parties = Parties.all()
    background_url('back_parties.jpg')
    linear_gradient('rgba(0,0,0,.3)', 'rgba(0,0,0,.5)')
  end

  def party
    @party = Parties.find_by_id(params[:id])
    @user = User.find_by_id(@party.party_member_id)
    @users = User.all
    if @party.image.url != nil
      background_url(@party.image.url)
    else
      background_url('back_parties.jpg')
    end
    linear_gradient('rgba(0,0,0,.3)', 'rgba(0,0,0,.5)')
  end

  def create_campaign
    if current_user.campaigns_slot == nil
      current_user.update_attribute(:campaigns_slot, 1)
    else
      current_user.update_attribute(:campaigns_slot, current_user.campaigns_slot + 1)
    end
    @campaign = Campaign.new(name: params[:name], creator: current_user.id, slot: current_user.campaigns_slot, description: params[:description], private: params[:private])
    if @campaign.save
      redirect_to "/campaigns"
    else
      puts "dang"
    end
  end

  def create_party
    @party = Parties.new(party_member_id: current_user.id)
    if @party.save
      redirect_to "/party/#{@party.id}"
    else
      puts "dang"
    end
  end

  def add_to_party
    @party_member = PartyMembers.new(user_id: params[:uid], party_id: params[:pid])
    if @party_member.save
      redirect_to "/party/#{params[:pid]}"
    else
      puts "dang"
    end
  end

  def update_user
    @user = User.find_by(id: current_user.id)
    if(@user)
      if(params[:username] != "" && params[:username] != current_user.username)
        @user.update_attribute(:username, params[:username])
      end
      if(params[:image] != "")
        @user.image = params[:image]
        @user.save!
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

  def update_campaign
    @campaign = Campaign.find_by(:creator=>params[:uid], :slot=>params[:id])
    if(@campaign)
      if(params[:image] != "")
        @campaign.image = params[:image]
        @campaign.save!
      end
      # if(params[:email] != "" && params[:email] != current_user.email)
      #   @user.update_attribute(:email, params[:email])
      # end
      if(params[:discription] != "" && params[:discription] != @campaign.description)
        @campaign.update_attribute(:description, params[:discription])
      end
      redirect_to "/campaign/#{params[:uid]}/#{params[:id]}"
    else
      puts("update campaign broken")
    end
  end
end
