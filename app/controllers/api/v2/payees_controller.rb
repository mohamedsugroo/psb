class Api::V2::PayeesController < ApiController
	before_action :current_user

	def index
		payees = Payee.all
		render json: payees
	end

	def show
		@payee = Payee.find(params[:id])
	end

	def create
		@payee = Payee.new(payee_params)
		newPayee = User.where(id: @payee.payee_id).first
		@payee.user_id = current_user.id
		@payee.info = newPayee.profile
	    if @payee.save
	      render json: @payee, status: :created
	    else
	      render json: { errors: @payee.errors.full_messages },
	             status: :unprocessable_entity
	    end
	end

	def destroy
		@payee = Payee.where(id: params[:id]).first
		@payee.destroy
	end

	private
		def payee_params
			params.permit(:user_id, :payee_id, :info)
		end
end