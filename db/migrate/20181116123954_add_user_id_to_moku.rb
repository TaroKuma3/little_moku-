class AddUserIdToMoku < ActiveRecord::Migration[5.2]
  def change
    add_column :mokus, :user_id, :integer
  end
end
