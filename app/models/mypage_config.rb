class MypageConfig < ApplicationRecord
belongs_to :user

# ↓MypageConfigの中身だと思ったからここに書いたけれど、ユーザーは作れても発動しなかった。
# 理由は、ユーザーを追加するときに、だからuser.rbに書くべき内容だったから。
# after_create :insert_mypage_edit

# validates :items, presence: true
# validates :introduce, presence: true
# validates :public, inclusion: { in: [true, false] }
# validates :user_id, presence: true
# end
