class MessagesController < ApplicationController

    # POST /messages
    def create
        message = Message.create!(user_id: session[:user_id], conversation_id: params[:conversation_id], content: params[:content])
        # broadcast new message to any subscribers of our ActionCable channel 'MessageFeedChannel'
        MessageFeedChannel.broadcast(user_id: session[:user_id], message)
        render json: message, status: :created
    end

    # DELETE /messages/:id
    def destroy
        message = find_message
        message.destroy
        head :no_content
    end

    # PATCH /messages/:id
    def update
        message = find_message
        message.update!(msg_params)
        render json: message, status: :accepted
    end

    private

    def find_message
        Message.find(params[:id])
    end

    def msg_params
        params.permit(:user_id, :conversation_id, :content) 
    end

end
