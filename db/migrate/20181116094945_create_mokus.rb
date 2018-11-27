class CreateMokus < ActiveRecord::Migration[5.2]
  def change
    create_table :mokus do |t|
      t.string :started_at
      t.string :finished_at
      t.integer :stopped_second
      t.string :alart_minutes

      t.timestamps
    end
  end
end
