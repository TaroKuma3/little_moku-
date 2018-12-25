class CreateMypageConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :mypage_configs do |t|
      t.text :items
      t.text :introduce

      t.timestamps
    end
  end
end
