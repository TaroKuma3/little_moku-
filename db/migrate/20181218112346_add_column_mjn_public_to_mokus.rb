class AddColumnMjnPublicToMokus < ActiveRecord::Migration[5.2]
  def change
    add_column :mokus, :mjn, :boolean, default: true, null: false
  end
end
