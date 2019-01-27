class RenameStoppedSecondColumnToMokus < ActiveRecord::Migration[5.2]
  def change
    rename_column :mokus, :stopped_second, :moku_time
  end
end
