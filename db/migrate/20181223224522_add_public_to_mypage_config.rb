class AddPublicToMypageConfig < ActiveRecord::Migration[5.2]
  def change
    add_column :mypage_configs, :public, :boolean, default: false, null: false
  end
end
