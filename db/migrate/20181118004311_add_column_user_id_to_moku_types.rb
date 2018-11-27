class AddColumnUserIdToMokuTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :moku_types, :user_id, :integer
  end
end
