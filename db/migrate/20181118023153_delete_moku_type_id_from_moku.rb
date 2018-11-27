class DeleteMokuTypeIdFromMoku < ActiveRecord::Migration[5.2]
  def change
    remove_column :mokus, :moku_type_id, :string
  end
end
