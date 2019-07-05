class Api::V1::SearchController < ApplicationController
	before_action :authorize_request
	def index
		query = params[:query]
		user = User.where("username LIKE :query", query: "%#{query}%")
		render json: user
	end
end