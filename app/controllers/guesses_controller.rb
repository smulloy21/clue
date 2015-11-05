class GuessesController < ApplicationController
  def create
    @guess = Guess.create(guess_params)
    card_params['card_selections'].each do |card|
      @guess.card_selections.create(player_id: @guess.player_id, card_id: card['card_id'])
    end
    flash[:notice] = 'You guessed ' + @guess.cards.suspect.name + ' in the ' + @guess.cards.room.name + ' with the ' + @guess.cards.weapon.name + '.'
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  private
  def guess_params
    params.require(:guess).permit(:player_id)
  end
  def card_params
    params.require(:guess).permit(:card_selections => [:card_id])
  end
end
