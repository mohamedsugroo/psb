class AuthenticationController < ApplicationController
  before_action :authorize_request, except: [:login, :test]

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def test 
  	exp = 24.hours.from_now
  	 render json: {
  	 	token1: 1,
  	 	exp: exp.to_i,
  	 	enc: JsonWebToken.encode(user_id: 1),
  	 	dec: JsonWebToken.decode("eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTgyODEyMzl9._7FDS6Xmd5Vj28TaFaI08FvAjcoTaZh7cYH-3lYN-MI")
  	 }
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end