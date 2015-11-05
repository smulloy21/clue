suspects = [
  ["Miss Scarlet", ''],
  ["Colonel Mustard", ''],
  ["Mrs. White", ''],
  ["Mr. Green", ''],
  ["Ms. Peacock", ''],
  ["Professor Plum", '']
]

rooms = [
  ["Hall", '', ["Study", "Lounge"]],
  ["Lounge", '', ["Hall", "Dining Room", "Conservatory"]],
  ["Dining Room", '', ["Lounge", "Kitchen"]],
  ["Kitchen", '', ["Dining Room", "Ballroom", "Study"]],
  ["Ballroom", '', ["Kitchen", "Conservatory"]],
  ["Conservatory", '', ["Ballroom", "Billiard Room", "Lounge"]],
  ["Billiard Room", '', ["Conservatory", "Library"]],
  ["Library", '', ["Billiard Room", "Study"]],
  ["Study", '', ["Library", "Hall", "Kitchen"]]
]

weapons = [
  ["Knife", ''],
  ["Candlestick", ''],
  ["Revolver", ''],
  ["Rope", ''],
  ["Wrench", ''],
  ["Lead Pipe", '']
]

suspects.each do |name, img|
  Card.create( name: name, img: img, type: 'Suspect' )
end

rooms.each do |name, img, adjoining_rooms|
  Card.create( name: name, img: img, type: 'Room' )
end

rooms.each do |name, img, adjoining_rooms|
  adjoining_rooms.each do |room|
    Room.where(name: name).first.next_rooms.push(Room.where(name: room).first)
  end
end

weapons.each do |name, img|
  Card.create( name: name, img: img, type: 'Weapon' )
end
