module Api
    class OwnersController < ApplicationController
        def index
            owners = Owner.order('created_at DESC');
            render json: {status: 'SUCESS', message: 'Loaded owners', data: owners}, status: :ok
        end

        def create
            owner = Owner.new(owner_params)

            if owner.save
                render json: {status: 'SUCESS', message: 'Added owners', data: owner}, status: :ok
            else
                render json: {status: 'ERROR', message: 'Owner not added', data: owner.errors}, status: :ok
            end
        end

        def owner_params
            params.permit(:name)
        end

        def destroy
            owner = Owner.find(params[:id])
            owner.destroy
            render json: {status: 'SUCCESS', message: 'Deleted owner', data: owner}, status: :ok
        end
    end
end