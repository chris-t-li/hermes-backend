class ConversationsController < ApplicationController

    # GET /conversations
    def index
        render json: Conversation.all, status: :ok
    end

    # GET /conversations/:id
    def show
        conversation = Conversation.find(params[:id])
        render json: conversation, serializer: ConversationThreadSerializer, status: :ok
    end
end
