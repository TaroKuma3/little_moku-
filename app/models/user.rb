class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :mokus#, dependent: :destroy
  has_many :moku_types#dependentは, v: :destroy
  has_many :works #dependentはブクマに関わるので調べてから
  has_many :likes #なし
  has_many :book_marks#, dependent: :destroy
  has_many :stamps　#なし
  has_many :faqs #管理者しか関係ない。管理者は退会してはいけないのでdependentせずこのまま。
  has_one :mypage_config# , dependent: :destroy #なし

  # before_create :insert_mypage_edit
  after_create :insert_default_moku_type

  validates :admin, inclusion: { in: [true, false] }
  validates :name, presence: true
  validates :public, inclusion: { in: [true, false] }

  def active_for_authentication?
    # super && ! self.deleted これは三項演算子による記述。砕けて書くと↓になる。
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
    else            #:moku_deletedのメッセージはconfig/locales/devise.en.ymlに作った。
      super　#:inactiveを返すようだ
    end
  end

  def active_moku_types
    moku_types = MokuType.where(deleted: false).where(user_id: self.id) #find_by,findだと１件しか拾わない
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

end
