class MessagesController < ApplicationController

    # GET /messages/:id [Do we need this?]
    def show
        render json: find_message, status: :ok
    end

    # POST /messages
    def create
        message = Message.create!(msg_params)
        render json: message, status: :created
    end

    private

    def find_message
        Message.find(params[:id])
    end

    def msg_params
        params.permit(:user_id, :conversation_id, :content) 
    end

end
