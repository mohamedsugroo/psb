class ApiController < ApplicationController
	# custom modules
	Auth = Api::V2::Auth::ChangePassword # change password module
	# refactor the imported code bellow and call it com a single transaction module
	Merchant = Api::V2::Modules::Merchant # Merchant module
	Accreditor = 	Api::V2::Modules::Accreditor # Accreditor module
	Consumer = 	Api::V2::Modules::Consumer # Consumer module
	# end refactoring and replace this code with a single module
	def index
		render json: :ok
	end

	def current_user
		header = request.headers['Authorization']
		header = header.split(' ').last if header
		begin
		  @decoded = Crypto.decrypt(header)
		  @current_user = User.find(@decoded[:user_id])
		rescue ActiveRecord::RecordNotFound => e
		  render json: { errors: e.message }, status: :unauthorized
		rescue JWT::DecodeError => e
		  render json: { errors: e.message }, status: :unauthorized
		end
	end


	def validate_token(token)
		token = token.to_s
		begin
			data = Crypto.decrypt(token)
			return { logged_in: true , data: data}
		rescue ActiveRecord::RecordNotFound => e
			return { logged_in: false, errors: e.message }
		rescue JWT::DecodeError => e
			return { logged_in: false, errors: e.message }
		end
	end
end
