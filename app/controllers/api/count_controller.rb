module Api
    class CountController < ApplicationController
        def show
            count = Pet.where(:owner_id => params[:id]).count;
            render json: {status: 'SUCESS', message: 'Loaded pets', data: count}, status: :ok
        end
    end
end