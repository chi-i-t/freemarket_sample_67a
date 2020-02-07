class ItemsController < ApplicationController

  def index
  end

  def new
    # @sample = Item.new
    # #セレクトボックスの選択肢にしたい要素配列
    # @sample_array_1 = ['aaa', 'bbb', 'ccc']
    # @sample_array_2 = [{id: 1, name: "aaa"}, {id: 2, name: "bbb"}, {id: 3, name: "ccc"}]

    # #初期値要素（データベースから読み取ったと仮定）
    # @selected_sample_1 = 'bbb'
    # @selected_sample_2 = {id: 2, name: "bbb"}


    # @item = Item.new
    # @item = Item.new

    @parents = Category.where(ancestry: nil)
    # @item = Item.new

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

  def category_params
    # params.require(モデル名).permit(カラム名, カラム名)
    params.require(:category).permit(:id, :name)

  end

end
