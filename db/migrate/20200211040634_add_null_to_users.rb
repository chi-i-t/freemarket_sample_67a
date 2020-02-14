class AddNullToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :family_name, false
    change_column_null :users, :first_name, false
    change_column_null :users, :family_name_kana, false
    change_column_null :users, :first_name_kana, false
    
  end
end
