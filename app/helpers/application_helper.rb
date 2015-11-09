module ApplicationHelper
  def next_player(player)
     next_player = (player.name == 'Professor Plum' ? Player.find(player.id - 5) : Player.find(player.id + 1))
  end

  def disprove_guess(player, guess)
    render('games/player', player: player, guess: guess) +
    (player.disprove_guess(guess) == false ? disprove_guess((next_player(player)), guess) : nil)
  end


end
