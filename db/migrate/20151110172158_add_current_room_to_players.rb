class AddCurrentRoomToPlayers < ActiveRecord::Migration
  def change
    create_table :player_locations do |t|
      t.integer :player_id
      t.integer :room_id
      t.timestamps null: false
    end
  end
end
