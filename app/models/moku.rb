class Moku < ApplicationRecord
  belongs_to :user
  belongs_to :moku_type
  has_many :works
  has_many :stamps

  # 終了時と中断時にも受け取るべきデーターがある。それらは今設定すると動かなくなるので設定してない
  # ただifで制御できちゃうかも

  validates :user_id, presence: true
  validates :moku_type_id, presence: true
  validates :mjn_public, inclusion: { in: [true, false] }

  def format_created_at
    self.created_at.strftime('%y/%m/%d  %H:%M')
  end
end
