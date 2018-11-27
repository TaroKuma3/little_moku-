class User < ApplicationRecord
  has_many :mokus
  has_many :moku_types
  has_many :works
  has_many :likes
  has_many :bookmarks
  has_many :stamps
end
