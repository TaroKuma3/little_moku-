class Work < ApplicationRecord
  belongs_to :moku
  belongs_to :user
  has_many :stamp
  has_many :book_marks

  has_many_attached :images

  validates :moku_id, presence: true
  validates :user_id, presence: true
  validates :title, presence: true
  validates :public, presence: true #booleanじゃなくてintegerだから
  validates :pick_up, presence: true #booleanじゃなくてintegerだから
end
