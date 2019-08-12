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
			@payeesList = current_user.friends
			@payees = @payeesList.map { |payee|  payee.user.profile}
			return @payees
		end

end