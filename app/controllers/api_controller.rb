class ApiController < ApplicationController
	Crypto = Api::V2::Crypto # encryption module
	def index
		render json: :ok
	end
end
