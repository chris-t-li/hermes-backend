class MessagesController < ApplicationController

    # POST /messages
    def create
        message = Message.create!(user_id: session[:user_id], conversation_id: params[:conversation_id], content: params[:content])
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
