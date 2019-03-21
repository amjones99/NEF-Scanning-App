class RemoveColumnsUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :uid
    remove_column :users, :mail
    remove_column :users, :ou
    remove_column :users, :dn
    remove_column :users, :sn
    remove_column :users, :givenname
    remove_column :users, :manager
  end
end
