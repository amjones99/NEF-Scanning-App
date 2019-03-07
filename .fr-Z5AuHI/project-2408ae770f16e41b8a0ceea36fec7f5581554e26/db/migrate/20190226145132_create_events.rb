class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :event_id
      t.string :name
      t.string :speaker
      t.string :location
      t.string :desc

      t.timestamps
    end
  end
end
