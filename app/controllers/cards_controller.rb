class CardsController < ApplicationController
# require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def create
  end

  def edit
  end

  def show
  end

  def destroy
  end

  def update
  end


end
