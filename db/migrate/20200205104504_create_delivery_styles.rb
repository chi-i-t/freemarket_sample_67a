class CreateDeliveryStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_styles do |t|
      t.string  :postage, null: false
      t.string  :area,    null: false
      t.string  :days,    null: false
      t.timestamps
    end
  end
end
