module Api
    class PetsController < ApplicationController
        def index
            pets = Pet.order('created_at DESC');
            render json: {status: 'SUCESS', message: 'Loaded pets', data: pets}, status: :ok
        end

        def create
            pets = Pet.new(article_params)
            if pets.save
                render json: {status: 'SUCCESS', message: 'Pet added', data: pets}, status: :ok
            else 
                render json: {status: 'ERROR', message: 'Pet not added',data:pets.errors},status: :unprocessable_entity
            end
        end

        def destroy
            pet = Pet.find(params[:id])
            pet.destroy
            render json: {status: 'SUCESS', message: 'Pet Deleted', data: pets}, status: :ok
        end

        private
        def article_params
            params.permit(:owner_id,:name,:breed,:color,:checked_in,:checked_in_date)
        end
    end
end