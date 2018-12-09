class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :mokus
  has_many :moku_types
  has_many :works
  has_many :likes
  has_many :book_marks
  has_many :stamps
end
