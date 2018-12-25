class MypageConfig < ApplicationRecord
belongs_to :user

# ↓MypageConfigの中身だと思ったからここに書いたけれど、ユーザーは作れても↓は発動しなかった。
# 理由は、ユーザーを追加するときに、だからuser.rbに書くべき内容だったから。
# after_create :insert_mypage_edit

  # private
  # def insert_mypage_edit
  #   mypage_config = MypageConfig.new(
  #     items: "主に使う道具・教材・機材・材料など。
  #     例：MacBook Air、ジャノメミシンJN508DX、ドットインストール、メディバンペイント、CanonEOS80D",
  #     introduce: "自己紹介をどうぞ！",
  #     public: false,
  #     user_id: self.id
  #   )

  #   mypage_config.save!
  # end
end
