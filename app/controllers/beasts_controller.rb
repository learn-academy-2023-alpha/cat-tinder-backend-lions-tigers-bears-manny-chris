class BeastsController < ApplicationController
      def index
            # Return all entries as an array of JSON objects
            beasts = Beast.all
            render json: beasts
      end

      def create
            # Create a new entry
            beast = Beast.create(beast_params)
            render json: beast
      end

      def update
            # Update an existing entry
            beast = Beast.find(params[:id])
            if beast.update(beast_params) 
                  render json: beast
            else
                  render json: beast.errors
            end
      end

      def destroy
            # Delete an existing entry
            beast = Beast.find(params[:id])
            if beast.destroy
                  render json: beast
            else
                  render json: beast.errors
            end
      end

      # Private variables for strong parameters
      private
      def beast_params 
            params.require(:beast).permit(:name, :age, :description, :image)
      end
end