class AddColumnAdminToUser < ActiveRecord::Migration[5.2]
  # booleanを使うときはデフォ値を設定する。nullが厄介だから。
  # y or nの２択なのでそれ以外の値はfalseになるようにも設定。
  # https://qiita.com/jnchito/items/a342b64cd998e5c4ef3d
  def change
    add_column :users, :admin, :boolean, default: false, null: false
  end
end
