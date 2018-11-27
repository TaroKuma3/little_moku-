class AddColumnContentToMoku < ActiveRecord::Migration[5.2]
  def change
    add_column :mokus, :content, :string
  end
end
