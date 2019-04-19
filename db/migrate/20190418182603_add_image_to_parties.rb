class AddImageToParties < ActiveRecord::Migration[5.2]
  def change
    add_column(:parties, :image, :string)
  end
end
