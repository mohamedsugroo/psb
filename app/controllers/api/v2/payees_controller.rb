class Api::V2::PayeesController < ApiController
	before_action :current_user

	def index
		render json: current_user.friends
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