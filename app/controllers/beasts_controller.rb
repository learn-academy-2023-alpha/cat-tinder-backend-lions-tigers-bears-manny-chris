class BeastsController < ApplicationController
      rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
      rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

      def render_unprocessable_entity_response(exception)
            render json: exception.record.errors, status: :unprocessable_entity
      end
        
      def render_not_found_response(exception)
            render json: { error: exception.message }, status: :not_found
      end

      def index
            # Return all entries as an array of JSON objects
            beasts = Beast.all
            render json: beasts
      end

      def create
            # Create a new entry
            beast = Beast.create(beast_params)
            if beast.valid?
                  render json: beast
            else 
                  render json: beast.errors, status: 422
            end

      end

      def update
            # Update an existing entry
            beast = Beast.find(params[:id])
            beast.update!(beast_params)
            render json: beast
      end

      def destroy
            # Delete an existing entry
            beast = Beast.find(params[:id])
            beast.destroy!
            render json: beast
      end

      # Private variables for strong parameters
      private
      def beast_params 
            params.require(:beast).permit(:name, :age, :description, :image)
      end
end