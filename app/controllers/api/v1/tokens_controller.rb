module Api
  module V1
    class TokensController < ApplicationController
      def index
        user = User.find_by(email: params[:email].downcase)
        puts user.email
        if user && user.valid_password?(params[:password])
          payload = {:id => user.id}
          if user.username != ""
            payload[:username] = user.username
          else
            payload[:username] = user.email
          end
          token = JsonWebToken.encode(payload)
        end
        render json: {status:'SUCCESS', message:'token request', data: token},status: :ok
      end
    end
  end
end
