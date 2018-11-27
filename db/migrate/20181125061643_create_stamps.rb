class CreateStamps < ActiveRecord::Migration[5.2]
  def change
    create_table :stamps do |t|
      t.integer :moku_id
      t.integer :work_id

      t.timestamps
    end
  end
end
