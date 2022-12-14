class UsersController < ApplicationController
    before_action :authorize
    skip_before_action :authorize, only: [:show, :create]
    
    # GET /users?query=params[:query]
    def index
        users = User.where("username like ?", "%#{params[:query]}%").and(User.where.not(id: session[:user_id]))
        render json: users, include: :contacts, status: :ok
    end

    # GET /users/:id
    # def show
    #     render json: find_user, status: :ok
    # end

    # GET /me
    def show
        user = find_user
        render json: user
    end

    # POST /users
    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # PATCH /me
    def update
        user = find_user
        user.update!(user_params)
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
        User.find(session[:user_id])
    end

    def authorize
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end

    def user_params
        params.permit(:username, :password, :password_confirmation, :email, :avatar_url)
    end
end
