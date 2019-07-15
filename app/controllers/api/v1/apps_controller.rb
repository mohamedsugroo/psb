module Api
  module V1
    class AppsController < ApplicationController
      before_action :authorize_request
      before_action :set_app, only: [:update, :destroy]

      def index
        apps = App.all
        render json: apps
      end

      def show
        @app = App.find(params[:uidn])
        render json: @app
      end

      def create
        @app = App.new(app_params)
        @app.user_id = authorize_request.id

        if @app.save
          render json: {
            status: :created, 
            location: @app
          }
        else
          render json: @app.errors, status: :unprocessable_entity
        end
      end

      def update
        if @app.update(app_params)
          render :show, status: :ok, location: @app
        else
          render json: @app.errors, status: :unprocessable_entity
        end
      end


      def destroy
        @app.destroy
      end

      private

        def set_app
          @app = App.find(params[:id])
        end

        def app_params
          params.permit(:name, :access_token, :user_id, :uidn, :app_type, :approved, :pending_approval, :active, :suspended, :soft_delete)
        end


    end # end Class
  end # end V1 module
end # end Api module