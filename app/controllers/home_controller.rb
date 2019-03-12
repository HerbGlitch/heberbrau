class HomeController < ApplicationController
  def show
    if current_user
      render 'userindex'
    else
      render 'index'
    end
  end

  def index
  end

  def userindex
  end
end
