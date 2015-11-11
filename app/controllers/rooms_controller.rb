class RoomsController < ApplicationController
  def show
    @room = Card.find(params[:id])
    @game = Game.find(params[:game_id])
    @answer = @game.answer
    @player = @game.players.user
    @players = @game.players.order(:id)
    @current_player = @players[@game.turn]
    @current_player.take_turn
    @guess = Guess.new()
    3.times do @guess.card_selections.build end
    @accusation = Accusation.new()
    3.times do @accusation.card_selections.build end
  end
end
