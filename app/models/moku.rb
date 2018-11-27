class Moku < ApplicationRecord
  belongs_to :user
  belongs_to :moku_type
  has_many :works
  has_many :stamps
end
