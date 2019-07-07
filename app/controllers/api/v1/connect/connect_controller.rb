class Api::V1::Connect::ConnectController < ApplicationController

    def index
        render json: :connected

    end
end
