class Api::V2::UsersController < ApiController
	def create
		
		@user = User.new(user_params)
		
		if @user.save
			render json: @user, status: :created

			begin
				Mailer.email_confirmation(@user).deliver_now
			rescue Aws::SES::Errors::ServiceError => err
				Rails.logger.info(err.message)
			end
		else
			render json: { errors: @user.errors.full_messages },
			status: :unprocessable_entity
		end

	end

	def change_password
		# questions 
		# pin code 16 digits
		# what is your username
		# 2 security questions
			# question 1
			# answer 1
			# question 2
			# answer 2
			# if all information is correct the ask for new password
			# Auth.match_answer('original answer','current answer')
		render json: {
			answer1: Auth.match_answer('h','h'),
			answer2: Auth.match_answer('Anime','a n i m e'),
		}

		# @user = User.where(username: params[:username]) if params[:username]
		# data = {
		# 	username: @username
		# }
		# key = Crypto.encrypt(data)
		# render json: {
		# 	params: params,
		# 	key: key,
		# 	key_decrypted: Crypto.decrypt(key)
		# }
	end

	private
		
		def user_params
			params.permit(
				:username, :email, :password, :password_confirmation, :first_name, :middle_name, :date_of_with, :pirth_place, :primary_phone_number, :secondary_phone_number, avatar: {}
				)
		end
end