class Micropost < ApplicationRecord
  belongs_to :user
 validates :content, presence: true, length: { maximum: 255 }
 ##############追加
  has_many :got_a_favorite,class_name: 'Favorite',foreign_key: 'micropost_id'
 has_many :favorite_users, through: :got_a_favorite,source: :user
###############



   
end
