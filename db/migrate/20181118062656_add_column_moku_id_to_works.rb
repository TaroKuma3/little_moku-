class AddColumnMokuIdToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :moku_id, :integer
  end
end
