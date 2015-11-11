class GamesController < ApplicationController
  def new
    @game = Game.new()
    @suspects = Suspect.all
  end

  def create
    @game = Game.create()
    @player = @game.players.where(name: params['who']).first
    @player.update(user: true)
    @room = @player.current_room
    redirect_to game_room_path(@game, @room)
  end

  def update
    @game = Game.find(params[:id])
    @game.next_turn
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end
end
