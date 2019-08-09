class ApiController < ApplicationController
	# custom modules
	Crypto = Api::V2::Crypto # encryption module
	Auth = Api::V2::Auth::ChangePassword # change password module
	Merchant = Api::V2::Modules::Merchant # Merchant module
	Accreditor = 	Api::V2::Modules::Accreditor # Accreditor module
	Consumer = 	Api::V2::Modules::Consumer # Consumer module
	def index
		render json: :ok
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
