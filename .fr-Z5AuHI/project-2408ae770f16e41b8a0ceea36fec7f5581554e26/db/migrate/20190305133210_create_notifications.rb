class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :not_id
      t.string :not_des
      t.timestamp :time

      t.timestamps
    end
  end
end
