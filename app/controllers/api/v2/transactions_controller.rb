class Api::V2::TransactionsController < ApiController

	def index
		account_type = 'merchant'
		if account_type == 'merchant'
		    result = Merchant.start
		elsif account_type == 'accreditor'
		    result =  Accreditor.start
		elsif account_type == 'consumer'
		    result =  Consumer.start
		end

		render json: result
	end

end