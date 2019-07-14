class Api::V1::Connect::ConnectController < ApplicationController
    before_action :authorize_request
    def index
        app = { name: "hello world", request_count: 200000 }
        render json: {
            app: app
        } 
    end
end
