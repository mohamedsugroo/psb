class Friend < ApplicationRecord
	belongs_to :user

	def user
		User.where(id: self.friend_id).first
	end
end
