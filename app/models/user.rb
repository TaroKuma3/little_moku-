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
  has_many :faqs
  has_one :mypage_config

  after_create :insert_default_moku_type, :insert_mypage_edit

# 管理者かどうか判断
# booleanは？のメソッドが必要なので、むしろ書かずともどこかに生えている。（Railsに限る）
# def admin?
#   self.admin
# end

# user_idはcurrent_user.idだとエラーになる。current_userはビューかコントローラで使う。
# ここはモデルなのでcurrent_userは使わない。そこでselfを使っている。
  private
  def insert_default_moku_type
    moku_type = MokuType.new(
      user_id: self.id,
      name: "とりあえずMOKUる",
    )
    moku_type.save!
  end

  def insert_mypage_edit
    mypage_config = MypageConfig.new(
      items: "主に使う道具・教材・機材・材料など。
      例：MacBook Air、ジャノメミシンJN508DX、ドットインストール、メディバンペイント、CanonEOS80D",
      introduce: "自己紹介をどうぞ！",
      public: false,
      user_id: self.id
    )

    mypage_config.save!
  end
end
