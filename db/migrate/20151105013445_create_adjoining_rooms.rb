class CreateAdjoiningRooms < ActiveRecord::Migration
  def change
    create_table :adjoining_rooms do |t|
      t.integer :room_id
      t.integer :next_room_id
    end
  end
end
