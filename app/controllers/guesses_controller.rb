class GuessesController < ApplicationController
  def create
    @guess = Guess.create(guess_params)
    card_params['card_selections'].each do |card|
      @guess.card_selections.create(player_id: @guess.player_id, card_id: card['card_id'])
    end
    @game = @guess.player.game
    @game.turn < @game.players.length - 1 ? @game.update(turn: @game.turn + 1) : @game.update(turn: 0)
    flash[:notice] = 'You guessed ' + @guess.cards.suspect.name + ' in the ' + @guess.cards.room.name + ' with the ' + @guess.cards.weapon.name + '.'
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def update
    @guess = Guess.find(params[:id]);
    @guessing_player = @guess.player;
    session[:return_to] ||= request.referer
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to) }
      format.js
    end
  end

  private
  def guess_params
    params.require(:guess).permit(:player_id)
  end
  def card_params
    params.require(:guess).permit(:card_selections => [:card_id])
  end
end
