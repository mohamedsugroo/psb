class Friend < ApplicationRecord
	belongs_to :user

	# def user
	# 	user = User.where(id: self.friend_id).first
	# 	return {
	# 		first_letter: user.full_name.delete(' ')[0],
	# 		username: user.username,
	# 		full_name: user.full_name,
	# 		added: self.created_at
	# 	}
	# end
end
