class MessagesController < ApplicationController

    # GET /messages/:id
    def show
        render json: find_message, status: :ok
    end

    # POST /messages
    def create
        message = Message.create!(msg_params)
        render json: 
    end

    private

    def find_message
        
    end
end
