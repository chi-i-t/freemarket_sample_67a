class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    # @item.images.new
    4.times{@item.images.build}

    # @parents = Category.where(ancestry: nil)
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
  # params.require(モデル名).permit(カラム名, カラム名)
  def item_params
    # params.require(:item).permit(:name, :description, :price, :status, :business_result, :buyer_id, images_attributes: [:name],category_id: [])
    params.require(:item).permit(:name, :description, :price, images_attributes: [:name])
  end


  # def category_params
  #   params.require(:category).permit(:id, :name)
  # end

end
