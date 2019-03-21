class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :game_dm do |t|
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
      t.belongs_to :game_dm, index: true

      t.timestamps
    end

  end
end
