module Api
    class PetsController < ApplicationController
        def index
            pets = Pet.order('created_at DESC');
            render json: {status: 'SUCESS', message: 'Loaded pets', data: pets}, status: :ok
        end
    end
end