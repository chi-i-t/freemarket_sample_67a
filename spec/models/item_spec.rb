require 'rails_helper'

# ------テスト内容------

# アイテムを保存できる場合
#   - 画像、商品名、説明文、カテゴリー、商品の状態、配送料の負担、発送の方法、
#     発送の地域、発送までの日数、価格があれば保存できる。

# 商品を保存できない場合
#   - 上記の内、どれか一つでも無いと保存できない
#   - 商品名が40字以上の場合
#   - 説明文が1000字以上の場合
#   - 価格が¥300以下の場合
#   - 価格が¥9,999,999以上の場合


describe Item do
  describe '#create' do
    it "is invalid without a name (商品名は必須です) " do

      item = Item.new(name: "", price: "1000", business_result: "900", description: "test", catefory_id: "513", prefecture_id: "0", delivery_fee_id:"1", delivery_way_id:"1", delivery_day_id: "1", item_condition_id: "1", status: "0", images_attributes: [:src, :_destroy, :id])
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
  end
end