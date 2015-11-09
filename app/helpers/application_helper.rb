module ApplicationHelper
  # def take_turn(game)
  #   @players[game.turn].guesses.create()
  #   @players[game.turn].guesses.last.card_selections.push(CardSelection.create(card_id: Suspect.offset(rand(Suspect.count)).first.id))
  #   @players[game.turn].guesses.last.card_selections.push(CardSelection.create(card_id: Room.offset(rand(Room.count)).first.id))
  #   @players[game.turn].guesses.last.card_selections.push(CardSelection.create(card_id: Weapon.offset(rand(Weapon.count)).first.id))
  #
  #   game.turn < game.players.length - 1 ? game.update(turn: game.turn + 1) : game.update(turn: 0)
  # end
end
