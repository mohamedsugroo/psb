class ApiController < ApplicationController
	Crypto = Api::V2::Crypto # encryption module
	Auth = Api::V2::Auth::ChangePassword
	Merchant = Api::V2::Modules::Merchant
	Accreditor = 	Api::V2::Modules::Accreditor
	Consumer = 	Api::V2::Modules::Consumer
	def index
		render json: :ok
	end
end
