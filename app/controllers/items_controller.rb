class ItemsController < ApplicationController
  def index
  end

  def new

    #セレクトボックスの初期値設定
    @parents_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @parents_array << parent.name
    end

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

  
end
