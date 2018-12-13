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


  # after_commit :insert_default_moku_type

  # private
  # def insert_default_moku_type
  #   moku_type = MokuType.new(
  #     user_id: current_user.id,
  #     name: "とりあえずMOKUる",
  #   )
  #   moku_type.save!
  # end
end
