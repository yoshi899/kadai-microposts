class Micropost < ApplicationRecord
  belongs_to :user
  
  # 課題後の注意点を実装
  has_many :favorites, dependent: :destroy
  
  validates :content, presence: true, length: { maximum: 255 }
  
  # お気に入りしているかどうか、によって表示するボタンを変えるためのメソッド
  # def favorited_by? user
    # favorites.where(user_id: user.id).exists?
  # end
end
