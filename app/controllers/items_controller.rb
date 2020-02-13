class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.new # Productクラスのインスタンスに関連づけられた、Imageクラスのインスタンスを作成
  end

  def create 
    @item = Item.new(item_params)
    @item.status = "0"
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
    # if @item.update(item_params)
    #   redirect_to root_path
    # else
    #   render :edit
    # end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  # 出品用のストロングパラメータ
  # 値の受け取り制限を設定
  # params.require(モデル名).permit(カラム名, カラム名,...)
  def item_params
    params.require(:item).permit(:name, :description, :price, :business_result, :prefecture_id, :delivery_fee_id, :delivery_way_id, :status, images_attributes: [:src, :_destroy, :id])
  end

  # 商品編集・削除・詳細表示用
  def set_item
    @item = Item.find(params[:id])
  end
  
end
