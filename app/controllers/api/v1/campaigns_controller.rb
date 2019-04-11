module Api
  module V1
    class CampaignsController < ApplicationController
      def index
        @campaigns = Campaign.all
        render json: {status:'SUCCESS', message:'users loaded', data:@campaigns},status: :ok
      end
    end
  end
end
