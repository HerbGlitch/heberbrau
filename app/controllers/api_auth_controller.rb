class ApiAuthController < ApplicationController
  skip_before_action :verify_authenticity_token
  prepend SimpleCommand

  def index
  end
end
