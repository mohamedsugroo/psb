class Api::V2::PayeesController < ApiController
	before_action :current_user

	def index
		payees = Friend.where(user_id: current_user.id)
		list = []
		payees.each do |payee|
			list.push(User.find(payee.friend_id))
		end
		render json: {
			current_user: current_user.profile,
			payees: list
		}
	end

	def show
		@payee = Friend.find(params[:id])
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

	def destroy
		@payee = Friend.where(id: params[:id]).first
		@payee.delete
	end

	private
		def payee_params
			params.permit(:friend_id)
		end
end