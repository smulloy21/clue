class AccusationsController < ApplicationController
  def create
    @accusation = Accusation.create(accusation_params)
    card_params['card_selections'].each do |card|
      @accusation.card_selections.create(player_id: @accusation.player_id, card_id: card['card_id'])
    end
    @accusation.correct = (@accusation.cards == @accusation.player.game.answer.cards)
    if @accusation.correct
      flash[:notice] = 'You are correct! It was ' + @accusation.cards.suspect.name + ' in the ' + @accusation.cards.room.name + ' with the ' + @accusation.cards.weapon.name + '.'
    else
      flash[:alert] = 'Your accusation was incorrect. You have lost.'
    end
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  private
  def accusation_params
    params.require(:accusation).permit(:player_id)
  end
  def card_params
    params.require(:accusation).permit(:card_selections => [:card_id])
  end
end
