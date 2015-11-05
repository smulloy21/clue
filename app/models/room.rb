class Room < Card
  has_many :adjoining_rooms, :foreign_key => "room_id", :dependent => :destroy
  has_many :occurances_as_adjoining_room, :class_name => "AdjoiningRoom", :foreign_key => "next_room_id", :dependent => :destroy
  has_many :next_rooms, :through => :adjoining_rooms
end
