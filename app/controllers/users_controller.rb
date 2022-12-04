class UsersController < ApplicationController
    before_action :authorize
    skip_before_action :authorize, only: [:show]
    
    # GET /users
    def index
        render json: User.all, status: :ok
    end

    # GET /users/:id
    # def show
    #     render json: find_user, status: :ok
    # end

    # GET /me
    def show
        user = User.find_by(id: session[:user_id])
        render json: user
    end

    # POST /users
    def create
        # byebug
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
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

    def authorize
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end
