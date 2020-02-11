class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create 
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  # 値の受け取り制限を設定
  # params.require(モデル名).permit(カラム名, カラム名,...)
  def item_params
    params.require(:item).permit(:name, :description, :price)
  end
  
end
