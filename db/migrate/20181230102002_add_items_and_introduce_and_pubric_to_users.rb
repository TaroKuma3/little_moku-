class AddItemsAndIntroduceAndPubricToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :items, :string
    add_column :users, :introduce, :text
    add_column :users, :public, :boolean, default: false, null: false
  end
end
