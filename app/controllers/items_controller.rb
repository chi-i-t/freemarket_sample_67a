class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.new # Productクラスのインスタンスに関連づけられた、Imageクラスのインスタンスを作成

    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

    # 以下全て、formatはjsonのみ
    # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

   # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create 
    @item = Item.new(item_params)
    @item.status = "0"
    # binding.pry
    if @item.save
      flash[:notice] = '商品を出品しました'
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  # def update
    # if @item.update(item_params)
    #   redirect_to root_path
    # else
    #   render :edit
    # end
  # end

  # def destroy
  #   @item.destroy
  #   redirect_to root_path
  # end


  private
  # 出品用のストロングパラメータ
  # 値の受け取り制限を設定
  # params.require(モデル名).permit(カラム名, カラム名,...)
  def item_params
    params.require(:item).permit(:name, :description, :price, :business_result, :category_id, :prefecture_id, :delivery_fee_id, :delivery_way_id, :delivery_day_id, :item_condition_id, :status, images_attributes: [:src, :_destroy, :id])
  end

  # 商品編集・削除・詳細表示用
  def set_item
    @item = Item.find(params[:id])
  end
  
end
