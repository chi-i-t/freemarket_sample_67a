class PurchaseController < ApplicationController
  before_action :authenticate_user!

  require 'payjp'
  before_action :set_card, :set_item, only: [:index, :pay]

  def index
    
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
    
    @images = @item.images
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
      :customer => @card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
    )

    redirect_to action: 'done' #完了画面に移動
  end

  def done
    @item_buyer = Item.find(params[:item_id])
    @item_buyer.update(buyer_id: current_user.id)
  end

  private

  def set_card
    @card = Card.where(user_id: current_user).first
  end
  def set_item
    @item = Item.find(params[:item_id])
  end

end
