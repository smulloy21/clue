class RoomsController < ApplicationController
  def show
    @room = Card.find(params[:id])
    @game = Game.find(params[:game_id])
    @answer = @game.answer
    @player = @game.players.user
  end
end
