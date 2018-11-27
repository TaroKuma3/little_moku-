class CreateMokuTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :moku_types do |t|
      t.string :name
      t.string :string

      t.timestamps
    end
  end
end
