module Api
    class PetsController < ApplicationController
        def index
            pets = Pet.order('created_at DESC');
            render json: {status: 'SUCESS', message: 'Loaded pets', data: pets}, status: :ok
        end

        def create
            pets = Pet.new(article_params)

            if pets.save
                render json: {status: 'SUCESS', message: 'Pet added', data: pets}, status: :ok
            else 
                render json: {status: 'ERROR', message: 'Pet not added',data:article.errors},status: :unprocessable_entity
            end
        end

        private
        def article_params
            params.permit(:owner_id,:name,:breed,:color,:checked_in,:checked_in_date)
        end
    end
end