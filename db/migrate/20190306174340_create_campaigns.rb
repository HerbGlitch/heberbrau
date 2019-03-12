class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :dungeon_masters do |t|
      t.references :user

      t.timestamps
    end

    create_table :party_members do |t|
      t.references :user, index: true

      t.timestamps
    end

    create_table :parties do |t|
      t.belongs_to :party_member, index: true

      t.timestamps
    end

    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.belongs_to :dungeion_master, index: true

      t.timestamps
    end

  end
end
