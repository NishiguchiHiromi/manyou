class SetDefaultToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :password, false
    change_column_null :users, :email, false
    change_column_default :users, :type, 1
  end
end
