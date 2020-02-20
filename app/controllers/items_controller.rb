class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  
  def index
    @items = Item.last(5)
  end


  def new
    @item = Item.new
    @item.images.new # Productクラスのインスタンスに関連づけられた、Imageクラスのインスタンスを作成
    @category_parent_array = ["---"]

    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.roots.pluck(:name).each do |parent|
      @category_parent_array << parent
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

    if @images_array.present? && @item.save
      redirect_to root_path, notice: '商品を出品しました'
    else
      # render :new だとViewのカテゴリ選択のところでエラーが発生する
      redirect_to "/items/new", alert: '出品に失敗しました。必須項目を確認してください。'
    end
  end


  def show
    @images = @item.images
    @grandchild = Category.find(@item.category_id)
  end


  def edit
    # データベースから、親カテゴリーのみ抽出し、配列化
    # リファクタリング rootを使うと一気に親まで辿れる
    # pluckを使うことで高速にデータベースから特定カラムのデータを抽出できる
    @category_parent_array = Category.roots.pluck(:name)

    # itemに紐づいていいる孫カテゴリーの親である子カテゴリが属している子カテゴリーの一覧を配列で取得
    @category_child_array = @item.category.parent.parent.children

    # itemに紐づいていいる孫カテゴリーが属している孫カテゴリーの一覧を配列で取得
    @category_grandchild_array = @item.category.parent.children
  end


  def update
    if @item.update(item_params)
      redirect_to root_path, notice: '商品を編集しました'
    else
      redirect_to root_path, alert: '編集できませんでした。必須項目をご確認ください。'
    end
  end


  def destroy
    if @item.user_id == current_user.id && @item.destroy
      redirect_to root_path, notice: '商品を削除しました'
    else
      redirect_to item_path
    end
  end


  private
  # 出品用のストロングパラメータ
  # 値の受け取り制限を設定
  # params.require(モデル名).permit(カラム名, カラム名,...)


  def item_params
    @images_array = params[:item][:images_attributes]
    params.require(:item).permit(:name, :description, :price, :business_result, :category_id, :prefecture_id, :delivery_fee_id, :delivery_way_id, :delivery_day_id, :item_condition_id, :status, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def item_update_params
  #   params.require(:item).permit(:name, :detail, :category, :price, :status, :state, :city, :delivery, :delivery_time, :fee_payer).merge(user_id: current_user.id)
  # end

end
