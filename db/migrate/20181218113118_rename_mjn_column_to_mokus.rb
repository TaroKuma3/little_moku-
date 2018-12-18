class RenameMjnColumnToMokus < ActiveRecord::Migration[5.2]
  def change
    rename_column :mokus, :mjn, :mjn_public
  end
end
