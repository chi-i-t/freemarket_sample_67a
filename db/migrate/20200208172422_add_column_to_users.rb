class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :family_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :family_name_kana, :string, null: false
    add_column :users, :first_name_kana, :string, null: false
    add_column :users, :nickname, :string, null: false
    add_column :users, :birthday, :date, null: false
    add_column :users, :phone_number, :string
  end
end
