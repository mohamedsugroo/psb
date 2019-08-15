class Api::V2::PayeesController < ApiController
	before_action :current_user

	def index
		payees = Payee.all
		render json: payees
	end

	def list
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