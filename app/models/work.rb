class Work < ApplicationRecord
  belongs_to :moku
  belongs_to :user
  has_many :stamp
  has_many :book_marks
end
