class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :item, optional: true #nullを許可
end
