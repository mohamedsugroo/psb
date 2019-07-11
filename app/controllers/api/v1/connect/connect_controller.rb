class Api::V1::Connect::ConnectController < ApplicationController
    before_action :connect_auth
    def index

        app = { name: "hello world", request_count: 600000 }

        if connect_auth
            render json: {
                app: app
            } 
        else
            render json: {
                errors: 'unauthorized'
            } 
        end

    end


end
