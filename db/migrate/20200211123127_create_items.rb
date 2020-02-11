class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string      :name
      t.text        :description
      t.integer     :price
      t.integer     :business_result
      t.string      :status
      t.integer     :buyer_id
      t.timestamps
    end
  end
end
