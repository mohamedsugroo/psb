class Api::V2::PayeesController < ApiController
	before_action :current_user

	def index
		payees = current_user.friends
		payeeList = []
		payees.each do |payee|
			user = User.where(id: payee.friend_id).first
			payeeList.push({
				username: user.username,
				first_name: user.first_name,
				middle_name: user.middle_name,
				last_name: user.last_name
			})
		end
		render json: {
			payees: payeeList
		}
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

end