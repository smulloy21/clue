class AdjoiningRoom < ActiveRecord::Base
  belongs_to :room
  belongs_to :next_room, :class_name => "Room", :foreign_key => "next_room_id"
end
