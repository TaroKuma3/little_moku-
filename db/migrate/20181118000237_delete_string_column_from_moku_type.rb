class DeleteStringColumnFromMokuType < ActiveRecord::Migration[5.2]
  def change
    remove_column :moku_types, :string
  end
end