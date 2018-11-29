class ChangeBodkMarksColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :book_marks, :moku_id, :integer
    add_column :book_marks, :work_id, :integer
  end
end
