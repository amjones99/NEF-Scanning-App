class AddDateToConferences < ActiveRecord::Migration[5.2]
  def change
    add_column :conferences, :start_date, :date
    add_column :conferences, :end_date, :date
  end
end
