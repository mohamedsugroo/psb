class ApplicationController < ActionController::API

	def not_found
		render json: { error: 'not_found' }
	end


	def authorize_request
		header = request.headers['Authorization']
		header = header.split(' ').last if header
		begin
		  @decoded = JsonWebToken.decode(header)
		  @current_user = User.find(@decoded[:user_id])
		rescue ActiveRecord::RecordNotFound => e
		  render json: { errors: e.message }, status: :unauthorized
		rescue JWT::DecodeError => e
		  render json: { errors: e.message }, status: :unauthorized
		end
	end


	def accesss_token
		header = request.headers['Authorization']
		header = header.split(' ').last if header
		begin
		  @decoded = JsonWebToken.decode(header)
		  @current_user = App.find(@decoded[:app_id])
		rescue ActiveRecord::RecordNotFound => e
		  render json: { errors: e.message }, status: :unauthorized
		rescue JWT::DecodeError => e
		  render json: { errors: e.message }, status: :unauthorized
		end
	end

end
