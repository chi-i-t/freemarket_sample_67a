class AddBuyerToItems < ActiveRecord::Migration[5.0]
  def change
    # add_reference :items, :buyer, optional: { to_table: :users }
  end
end
