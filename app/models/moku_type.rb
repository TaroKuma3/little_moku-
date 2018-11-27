class MokuType < ApplicationRecord
  belongs_to :user
  has_many :mokus
end
