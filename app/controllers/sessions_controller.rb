class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:username] ||= params[:username]
            # byebug
            # cookies[:user_id] ||="hello"
            render json: {session: session}, status: :created
        else
            render json: {error: {login: "Invalid username or password"}}, status: :unauthorized
        end
    end

    def destroy
        session.delete :username
        head :no_content
    end
end
