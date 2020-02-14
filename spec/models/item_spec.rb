require 'rails_helper'

# ------テスト内容------

# アイテムを保存できる場合
#   - 商品名、説明文、カテゴリー、商品の状態、配送料の負担、発送の方法、
#     発送の地域、発送までの日数、価格があれば保存できる。

# 商品を保存できない場合
#   - 上記の内、どれか一つでも無いと保存できない
#   - 商品名が40字以上の場合
#   - 説明文が1000字以上の場合
#   - 価格が¥300以下の場合
#   - 価格が¥9,999,999以上の場合


describe Item do
  describe '#create' do

    context 'can save' do
      it 'is valid with all params' do
        expect(build(:item)).to be_valid
      end
    end

    context 'cannot save' do
      it "is invalid without a name" do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end
      it "is invalid without a description" do
        item = build(:item, description: nil)
        item.valid?
        expect(item.errors[:description]).to include("can't be blank")
      end
      it "is invalid without a price" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end
      it "is invalid without a businbess result" do
        item = build(:item, business_result: nil)
        item.valid?
        expect(item.errors[:business_result]).to include("can't be blank")
      end
      it "is invalid without a category" do
        item = build(:item, category_id: nil)
        item.valid?
        expect(item.errors[:category_id]).to include("can't be blank")
      end
      it "is invalid without a prefecture" do
        item = build(:item, prefecture_id: nil)
        item.valid?
        expect(item.errors[:prefecture_id]).to include("can't be blank")
      end
      it "is invalid without a delivery fee" do
        item = build(:item, delivery_fee_id: nil)
        item.valid?
        expect(item.errors[:delivery_fee_id]).to include("can't be blank")
      end
      it "is invalid without a delivery way" do
        item = build(:item, delivery_way_id: nil)
        item.valid?
        expect(item.errors[:delivery_way_id]).to include("can't be blank")
      end
      it "is invalid without a delivery day" do
        item = build(:item, delivery_day_id: nil)
        item.valid?
        expect(item.errors[:delivery_day_id]).to include("can't be blank")
      end
      it "is invalid without a item condition" do
        item = build(:item, item_condition_id: nil)
        item.valid?
        expect(item.errors[:item_condition_id]).to include("can't be blank")
      end
      it "is invalid without a status" do
        item = build(:item, status: nil)
        item.valid?
        expect(item.errors[:status]).to include("can't be blank")
      end
    end

  end
end