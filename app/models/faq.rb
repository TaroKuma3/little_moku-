class Faq < ApplicationRecord
  belongs_to :user

  validates :questions, presence: true
  validates :answer, presence: true
  validates :category, presence: true
  validates :user_id, presence: true
end
