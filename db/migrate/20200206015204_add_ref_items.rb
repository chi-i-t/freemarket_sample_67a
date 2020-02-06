class AddRefItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :user, foreign_key: true
    add_reference :items, :category, foreign_key: true
    add_reference :items, :brand, foreign_key: true
    add_reference :items, :delivery_style, foreign_key: true
  end
end
