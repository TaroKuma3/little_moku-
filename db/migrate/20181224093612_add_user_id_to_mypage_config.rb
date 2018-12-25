class AddUserIdToMypageConfig < ActiveRecord::Migration[5.2]
  def change
    add_column :mypage_configs, :user_id, :integer
  end
end
