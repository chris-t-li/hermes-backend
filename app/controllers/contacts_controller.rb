class ContactsController < ApplicationController
    # before_action :authorize

    # GET /contacts
    def index
        byebug
        user = find_user
        contacts = user.Contacts
        render json: contacts, status: :ok
    end

    private

    def find_user
        byebug
        User.find(session[:user_id])
    end

    # def authorize
    #     return render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :user_id
    # end
end
