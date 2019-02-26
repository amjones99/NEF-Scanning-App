class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :userid
      t.string :username
      t.string :password
      t.integer :access
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
