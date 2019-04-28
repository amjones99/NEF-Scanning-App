class AddTempPwToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :temp_pw, :string
  end
end
