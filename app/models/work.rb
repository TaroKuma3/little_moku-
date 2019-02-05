class Work < ApplicationRecord
  belongs_to :moku
  belongs_to :user
  has_many :stamp #使わない
  has_many :book_marks

  has_many_attached :images

  validates :moku_id, presence: true
  validates :user_id, presence: true
  validates :title, presence: true
  validates :comment_public, presence: true #booleanじゃなくてintegerだからpresence: true
  validates :pick_up, presence: true #booleanじゃなくてintegerだからpresence: true
end
