class SessionsController < ApplicationController

    # POST /login
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            # byebug
            # cookies[:user] ||= user
            render json: user, status: :created
        else
            render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end

    # DELETE /logout
    def destroy
        session.delete :user_id
        head :no_content
    end

    # GET /myconversations
    def show_my_convos
        # byebug
        # abort session.inspect

        user = User.find_by(id: session[:user_id])
        convos = user.conversations
        render json: convos, status: :ok
        # convo_id_array = Participant.where(user: user).map{|p| p.conversation_id}
        # render json: Conversation.find(convo_id_array), status: :ok
    end
end
