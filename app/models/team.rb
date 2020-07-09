class Team < ApplicationRecord
	belongs_to :user
	hasmany :book_comments, dependent: :destroy
	hasmany :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
