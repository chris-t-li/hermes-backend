class SessionsController < ApplicationController

    def show
        # byebug
        user = User.find(session[:user_id])
        render json: user
    end
    # POST /login
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
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
        # abort session.inspect
        user = User.find_by(id: session[:user_id])
        conversations = user.conversations
        # byebug
        render json: conversations, status: :ok
    end

    # GET /mycontacts
    def show_my_contacts
        
        user = User.find_by(id: session[:user_id])

        contacts = Contact.where(friend_id: session[:user_id]).or(Contact.where(user_id: session[:user_id]))

        render json: contacts, status: :ok
        # array_of_user_id = []
        # contacts.map do |c| 
        #     array_of_user_id << c.user_id
        #     array_of_user_id << c.friend_id
        # end
        
        # users = User.find(array_of_user_id.uniq.filter{|id| id!= session[:user_id] })
        # byebug


        # render json: users, status: :ok
    end
end
