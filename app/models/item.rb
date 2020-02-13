class Item < ApplicationRecord
  has_many :images, dependent: :destroy

  # fields_forメソッドを利用する際に、親モデルの中に書く必要があるメソッド。引数として子モデルの名前を書く。
  # allow_destroy: trueで親のレコードが削除された場合に、関連付いている子のレコードも一緒に削除してくれます
  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_way
  belongs_to_active_hash :prefecture

end
