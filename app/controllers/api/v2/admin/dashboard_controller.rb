class Api::V2::Admin::DashboardController < ApiController

	def index
		render json: 'Admin Ready to go!'
	end

	def login
		@admin = Admin.find_by_username(params[:username])
	    if @admin&.authenticate(params[:password])
	    	token = Crypto.encrypt(user_id: @admin.id)
	    	render json: { token: token, username: @admin.username }, status: :ok
	    else
	    	render json: { error: 'unauthorized' }, status: :unauthorized
	    end

	end


	
end