class AddUserIdToFaq < ActiveRecord::Migration[5.2]
  def change
    add_column :faqs, :user_id, :integer
  end
end
