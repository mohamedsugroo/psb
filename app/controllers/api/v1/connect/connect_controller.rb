class Api::V1::Connect::ConnectController < ApplicationController
    # before_action :connect_auth
    def index
        render json: 'connect'
    end


end
