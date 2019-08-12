class Api::V2::PayeesController < ApiController
	before_action :current_user

	def index
		payees = current_user.friends
		payees.each { |payee|  payee.user = User}
		render json: {
			payees: payees
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