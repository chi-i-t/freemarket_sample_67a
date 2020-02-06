class AddRefImages < ActiveRecord::Migration[5.0]
  def change
    add_reference :images, :item, foreign_key: true
  end
end
