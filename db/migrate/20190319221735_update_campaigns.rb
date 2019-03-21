class UpdateCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column(:campaigns, :creator, :integer, null: true)
    add_column(:campaigns, :slot, :integer, null: true)
  end
end
