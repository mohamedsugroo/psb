class Api::V2::HomeController < ApiController
	def index
		render json: {
			alert: 'Please login to use this api',
			api_version: ['api controller', version: 2]
		}
	end	

	def login
		@user = User.find_by_username(params[:username])
		if @user&.authenticate(params[:password])
			token = JsonWebToken.encode({user_id: @user.id, username: @user.username})
			time = Time.now + 18.hours.to_i
			render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"), username: @user.username }, status: :ok
       else
       	render json: { error: 'unauthorized' }, status: :unauthorized
       end
	end

	def resetpassword
		# pin code 16 digits
		@user = User.find_by_username(params[:username]) if params[:username]
		render json: @user
	end

	def check_token
		render json: validate_token(params[:key])
	end
end