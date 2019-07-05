class Api::V1::UsersController < ApplicationController
	before_action :authorize_request, except: :create
	before_action :find_user, except: %i[create index]

  def index
  	@users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end


  private
  
  def find_user
    @user = User.find_by_username!(params[:_username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

	def user_params
		params.permit(
			:username, :email, :password, :password_confirmation, :first_name, :middle_name, :date_of_with, :pirth_place, :primary_phone_number, :secondary_phone_number
		)
	end


end
