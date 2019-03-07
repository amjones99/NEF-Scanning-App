class CreateConferences < ActiveRecord::Migration[5.2]
  def change
    create_table :conferences do |t|
      t.integer :conf_id
      t.integer :days
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
