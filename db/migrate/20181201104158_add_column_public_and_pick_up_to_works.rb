class AddColumnPublicAndPickUpToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :public, :integer
    add_column :works, :pick_up, :integer
  end
end
