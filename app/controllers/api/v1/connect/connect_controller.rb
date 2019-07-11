class Api::V1::Connect::ConnectController < ApplicationController
    before_action :authorize_request
    def index
        render json: App.all
    end


end
