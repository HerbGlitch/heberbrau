class AddUsernameAndDiscriptionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column(:users, :username, :string, limit: 50, null: false, default: '')
    add_column(:users, :discription, :string, limit: 10000, null: false, default: '')
    add_column(:users, :campaigns_slot, :integer, null: true)
    add_column(:users, :sidebar_active, :boolean, default: true)
  end
end
