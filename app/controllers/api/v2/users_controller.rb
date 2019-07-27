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
			flash.now[:alert] = t('.failure')
			render json: { errors: @user.errors.full_messages },
			status: :unprocessable_entity
		end

	end

	def change_password
		key = Crypto.encrypt(user_id: 'hello')
		render json: {
			params: params,
			key: key,
			key_decrypted: Crypto.decrypt(key)
		}
	end

	private
		
		def user_params
			params.permit(
				:username, :email, :password, :password_confirmation, :first_name, :middle_name, :date_of_with, :pirth_place, :primary_phone_number, :secondary_phone_number, avatar: {}
				)
		end
end