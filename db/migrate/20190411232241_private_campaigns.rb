class PrivateCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column(:campaigns, :private, :boolean, default: false)
  end
end
