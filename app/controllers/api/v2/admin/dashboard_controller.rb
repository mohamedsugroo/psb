class Api::V2::Admin::DashboardController < ApiController

	def index
		render json: 'Admin Ready to go!'
	end

	def create
		@admin = Admin.new(user_params)
		
		if @admin.save
			render json: @admin, status: :created

			begin
				Mailer.email_confirmation(@admin).deliver_now
			rescue Aws::SES::Errors::ServiceError => err
				Rails.logger.info(err.message)
			end
		else
			render json: { errors: @admin.errors.full_messages },
			status: :unprocessable_entity
		end
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