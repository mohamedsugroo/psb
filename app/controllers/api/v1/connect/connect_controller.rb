class Api::V1::Connect::ConnectController < ApplicationController
    # before_action :connect_auth
    def index

        app = { name: "hello world", request_count: 600000 }
        render json: {
            app: app
        } 

    end


end
