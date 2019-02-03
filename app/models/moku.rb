class Moku < ApplicationRecord
  belongs_to :user
  belongs_to :moku_type
  has_many :works
  has_many :stamps　#使わない

  #create時からずっと
  validates :user_id, presence: true
  validates :moku_type_id, presence: true
  validates :mjn_public, inclusion: { in: [true, false] }
  validates :started_at, presence: true

  #update == MOKU終了時以降
  validates :finished_at, presence: true, on: :update
  validates :moku_time, presence: true, on: :update

  def format_created_at
    self.created_at.strftime('%y/%m/%d  %H:%M')
  end
end
