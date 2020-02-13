class AddColumnToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :delivery_fee_id, :integer, null: false #送料の負担
    add_column :items, :delivery_way_id, :integer, null: false #発送方法
    add_column :items, :prefecture_id, :integer, null: false #発送元
  end
end
