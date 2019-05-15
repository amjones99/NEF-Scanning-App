class AddTimetableImageFileToTimetables < ActiveRecord::Migration[5.2]
  def change
    add_column :timetables, :timetable_image_file, :string
  end
end
