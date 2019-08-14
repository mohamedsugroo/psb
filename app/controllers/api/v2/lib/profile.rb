module Api::V2::Lib::Profile

	def self.users(users) 
		users.each do |user|
			# User.where(id: user.friend_id)
			# profiled_user(newuser)
			'user.friend_id'
		end
	end

	private 
		def profiled_user(user)
			return {
				username: user.username,
				fullname: "#{user.first_name} #{user.middle_name} #{user.last_name}",
				initial: user.first_name[0]
			}
		end

end
