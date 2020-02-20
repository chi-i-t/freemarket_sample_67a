class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string      :name
      t.text        :description
      t.integer     :price
      t.integer     :business_result
      t.string      :status
      t.timestamps
    end
  end
end
