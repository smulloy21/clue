class GamesController < ApplicationController
  def new
    @game = Game.new()
    @suspects = Suspect.all
  end

  def create
    @game = Game.create()
    @room = Room.offset(rand(Room.count)).first
    @player = @game.players.where(name: params['who']).first
    @player.update(user: true)
    redirect_to game_room_path(@game, @room)
  end
end
