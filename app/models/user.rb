class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :mokus, dependent: :destroy
  has_many :moku_types, dependent: :destroy
  has_many :works #ブクマに関わるので調べてから
  has_many :likes #なくす予定
  has_many :book_marks, dependent: :destroy
  has_many :stamps　#なくす予定だけどやっぱりやりたいかな
  has_many :faqs #管理者しか関係ない。管理者は退会してはいけないのでこのまま。
  has_one :mypage_config , dependent: :destroy

  # before_create :insert_mypage_edit
  after_create :insert_default_moku_type

  validates :admin, inclusion: { in: [true, false] }
  validates :name, presence: true
  # validates :items, presence: true
  # validates :introduce, presence: true
  validates :public, inclusion: { in: [true, false] }

  def active_for_authentication?
    # super && ! self.deleted
    if self.deleted
      false
    else
      super
    end
  end

  def inactive_message #非アクティブのユーザーが
    # self.deleted? ? super : :delete

    if self.deleted
      :moku_deleted #deleted == trueならこのメッセージを出すようにする。デフォルトのメッセージだとログインできない理由が正当ではなくなる
    else
      super　#:inactiveを返すようだ
    end
  end


# 管理者かどうか判断
# booleanは？のメソッドが必ず必要なので、むしろ書かずともどこかに生えている。（Railsに限る）
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

  # def insert_mypage_edit
  #     self.items = "主に使う道具・教材・機材・材料などをどうぞ。画面下方から編集できます！"
  #     self.introduce = "自己紹介をどうぞ。画面下方から編集できます！"
  #     puts "テスト！"
  # end



  
end
