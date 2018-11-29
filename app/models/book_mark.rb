class BookMark < ApplicationRecord
  belongs_to :user
  validates :user_id, {presence: true}
  validates :work_id, {presence: true}
end
