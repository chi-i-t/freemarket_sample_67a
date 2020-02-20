class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string      :name
      t.text        :description
      t.integer     :price
      t.integer     :business_result
      t.string      :status
      t.reference   :buyer_id, optional: { to_table: :users }
      t.timestamps
    end
  end
end
