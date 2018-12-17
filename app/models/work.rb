class Work < ApplicationRecord
  belongs_to :moku
  belongs_to :user
  has_many :stamp
  has_many :book_marks

  has_many_attached :images
end
