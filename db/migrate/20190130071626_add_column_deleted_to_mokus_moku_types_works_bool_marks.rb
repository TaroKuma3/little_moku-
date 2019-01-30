class AddColumnDeletedToMokusMokuTypesWorksBoolMarks < ActiveRecord::Migration[5.2]
  def change
    add_column :mokus, :deleted, :boolean, default: false, null: false
    add_column :moku_types, :deleted, :boolean, default: false, null: false
    add_column :works, :deleted, :boolean, default: false, null: false
    add_column :book_marks, :deleted, :boolean, default: false, null: false
  end
end
