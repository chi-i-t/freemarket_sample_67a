class Item < ApplicationRecord
  # belongs_to :user
  # belongs_to :category
  # belongs_to :brand
  # belongs_to :delivery_style
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
end
