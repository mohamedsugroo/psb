class Api::V1::FriendsController < ApiController
	before_action :current_user
	
	def index
		myList = Friend.where(user_id: current_user.id)
		fiends = []
		
		myList.each do |list|
			user = find_user(list.friend_id)
			fiends.push({
				username: user.username,
				first_name: user.first_name.to_s,
				middle_name: user.middle_name.to_s,
				last_name: user.last_name.to_s,
				date_of_birth: user.date_of_with,
				birth_place: user.pirth_place
			})
		end

		render json: fiends
	end

	def create
		newfriend = params[:friend]
		user = User.where(id: newfriend)
		@friend = Friend.where(user_id: current_user.id).last
		Friend.create(
			user_id: current_user.id, 
			friend_id: newfriend.to_i
		)
		render json: {
			msg: 'Added user to your friends list',
			friend: @friend
		}
	end

	private

	def find_user(id)
		return User.where(id: id).first
	end

end