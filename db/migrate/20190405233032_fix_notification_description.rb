class FixNotificationDescription < ActiveRecord::Migration[5.2]

  def self.up
    rename_column :events, :desc, :description
  end

  def self.down
    rename_column :events, :description, :desc
  end

end
