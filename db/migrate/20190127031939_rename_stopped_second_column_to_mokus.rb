class RenameStoppedSecondColumnToMokus < ActiveRecord::Migration[5.2]
  def change
    rename_column :stopped_second, :moku_time
  end
end
