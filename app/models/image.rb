class Image < ApplicationRecord
  mount_uploader  :src  , ImageUploader
  belongs_to      :item , optional: true
  validates       :item , presence: true, on: :update # on :updateはupdateアクションの時のみにバリデーション検証が実行されるもの
  validates       :src  , presence: true, on: :update 
end
