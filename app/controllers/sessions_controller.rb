class SessionsController < ApplicationController
    # include BCrypt

    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:username] = params[:username]
            # byebug
            render json: user, status: :created
        else
            render json: {error: {login: "Invalid username or password"}}, status: :unauthorized
        end
    end

    def destroy
        session.delete :username
        head :no_content
    end
end
