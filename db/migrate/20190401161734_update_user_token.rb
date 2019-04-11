class UpdateUserToken < ActiveRecord::Migration[5.2]
  def change
    add_column(:users, :token, :text, null: true)
  end
end
