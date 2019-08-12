class Api::V2::PayeesController < ApiController
	before_action :current_user
	before_action :payees_list, only: [:index]

	def index
		render json: @payees
	end

	def create
		@payee = Friend.new(payee_params)
		@payee.user_id = current_user.id
	    if @payee.save
	      render json: @payee, status: :created
	    else
	      render json: { errors: @payee.errors.full_messages },
	             status: :unprocessable_entity
	    end
	end

	private
		def payee_params
			params.permit(:friend_id)
		end
		def payees_list
			myList = Friend.where(user_id: current_user.id)
			fiends = []
			myList.each do |list|
				user = User.where(id: list.friend_id).first
				fiends.push({
					username: user.username,
					full_name: user.full_name.to_s,
					date_of_birth: user.date_of_with.to_s,
					birth_place: user.pirth_place
				})
			end

			render json: fiends
		end

end