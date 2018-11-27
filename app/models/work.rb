class Work < ApplicationRecord
  belongs_to :moku
  belongs_to :user
  has_many :stamps
end
