class Campaign < ApplicationRecord
  def self.new_campaign(setup_data)
    where(creator: current_user.email, name: setup_data[:name]).first_or_create do | campaign |
      campaign.description = data[:description]
    end
  end
end
