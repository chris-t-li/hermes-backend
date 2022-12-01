class UsersController < ApplicationController

    # GET /users
    def index
        render json: User.all, status: :ok
    end

    # GET /users/:id
    def show
        render json: find_user, status: :ok
    end

    # POST /users
    def create
        user = User.create!(user_params)
        render json: user, status: :created
    end

    # PATCH /users/:id
    def update
        user = find_user
        user.udpate!(user_params)
        render json: user, status: :accepted
    end

    # DELETE /users/:id
    def destroy
        user = find_user
        user.destroy
        head :no_content
    end

    private

    def find_user
        User.find(params[:id])
    end

    def user_params
        params.permit(:username, :password, :email)
    end
end
