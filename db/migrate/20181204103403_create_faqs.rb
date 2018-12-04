class CreateFaqs < ActiveRecord::Migration[5.2]
  def change
    create_table :faqs do |t|
      t.string :questions
      t.string :answer
      t.string :category

      t.timestamps
    end
  end
end
