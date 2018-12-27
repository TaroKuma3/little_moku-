class DeleteAlartMinutesFromMoku < ActiveRecord::Migration[5.2]
  def change
    remove_column :mokus, :alart_minutes, :string
  end
end
