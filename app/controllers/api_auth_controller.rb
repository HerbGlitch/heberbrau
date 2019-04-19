class ApiAuthController < ApplicationController
  skip_before_action :verify_authenticity_token
  prepend SimpleCommand

  def index
    background_url('back_profile_u.jpg')
    linear_gradient('rgba(0,0,0,.5)', 'rgba(0,0,0,.8)')
  end
end
