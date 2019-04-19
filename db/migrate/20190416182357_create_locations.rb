class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.integer :campaing_slot
      t.integer :user_id

      t.timestamps
    end
  end
end
