module ApplicationHelper
  def disprove_guess(player, guess)
    render('games/player', player: player, guess: guess) +
    (player.disprove_guess(guess) == false && player.next_player != guess.player ? disprove_guess(player.next_player, guess) : guess.player.update(possible_cards: guess.player.possible_cards - [player.disprove_guess(guess)]))
  end


end
