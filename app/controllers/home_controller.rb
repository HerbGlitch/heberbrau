class HomeController < ApplicationController
  def show
    if current_user
      render 'profile/index'
    else
      render 'index'
    end
  end

  def index
  end
end
