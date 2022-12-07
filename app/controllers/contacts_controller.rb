class ContactsController < ApplicationController
    # before_action :authorize

    def show
        user = find_user
        render json: user.contacts, status: :ok
    end
    # GET /contacts
    def index
        user = find_user
        contacts = user.Contacts
        render json: contacts, status: :ok
    end

    # POST /contacts/
    def create
        # byebug
        contact = Contact.create!(user_id: session[:user_id], friend_id: params[:friend_id], accepted: "Pending")
        # add validations to contact model so that you cannot create an existing contact record
        render json: contact, status: :created
    end

    private

    def find_user
        User.find(session[:user_id])
    end

    # def authorize
    #     return render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :user_id
    # end
end
