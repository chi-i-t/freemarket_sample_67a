class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @parents = Category.where(ancestry: nil)

    # @parents = Category.all.order("id ASC").limit(13)
    # @parents = Category.where(category_params)
    # セレクトボックスの初期値設定
    # @parents = ["---"]
    # # データベースから、親カテゴリーのみ抽出し、配列化
    # Category.where(ancestry: nil).each do |parent|
    #   @parents << parent.name
    # end
  end

  def create 
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

  def item_params
    params.requier(:item).permit(:name, :description, :price, :status, :business_result, :buyer_id)
  end


  def category_params
    # params.require(モデル名).permit(カラム名, カラム名)
    params.require(:category).permit(:id, :name)
  end

end
