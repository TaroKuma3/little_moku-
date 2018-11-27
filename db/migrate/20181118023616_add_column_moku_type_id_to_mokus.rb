class AddColumnMokuTypeIdToMokus < ActiveRecord::Migration[5.2]
  def change
    add_column :mokus, :moku_type_id, :integer
  end
end
