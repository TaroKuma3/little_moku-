class RenamePublicToWorks < ActiveRecord::Migration[5.2]
  def change
    rename_column :works, :public, :comment_public
  end
end
