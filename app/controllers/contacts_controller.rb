class ContactsController < ApplicationController
    # before_action :authorize

    # GET /contacts/:Id
    def show
        user = find_user    
        render json: user.contacts, status: :ok
    end

    # GET /contacts
    def index
        user = User.find(1)
        # user = find_user
        contacts = user.contacts

        render json: contacts, status: :ok
    end

    # POST /contacts/
    def create
        # byebug
        contact = Contact.create!(user_id: session[:user_id], friend_id: params[:friend_id], accepted: "Pending")
        # add validations to contact model so that you cannot create an existing contact record
        render json: contact, status: :created
    end

    # PATCH /contacts/:id
    def update
        
        contact = Contact.where(user_id: session[:user_id], friend_id: params[:id]).or(Contact.where(friend_id: session[:user_id], user_id: params[:id]))[0]
        # byebug
        if contact.accepted 
            render json: {error: "Friendship already exists"}, status: :unprocessable_entity
        else
            contact.update(contact_params)
            render json: contact, status: :accepted
        end
        # byebug
    end

    private

    def find_user
        User.find(session[:user_id])
    end

    def contact_params
        params.permit(:user_id, :friend_id, :accepted)
    end

    # def authorize
    #     return render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :user_id
    # end
end
