class ConversationsController < ApplicationController
    before_action :authorize

    # GET /conversations
    def index
        render json: Conversation.all, status: :ok
    end

    # GET /conversations/:id
    def show
        render json: find_convo, status: :ok
    end

    # POST /conversations
    def create
        conversation = Conversation.create!(convo_params)

        #need to move this to Participants Controller
        params[:participants].each do |userID| # params[:participants] is an array of participant user IDs provided from the frontend. This will need to include the logged in user (seession[:user_id])
            Participant.create!(user_id: userID, conversation_id: conversation.id)
        end
        
        render json: conversation, status: :created
    end

    # PATCH /conversations/:id
    def update
        conversation = find_convo
        conversation.update!(convo_params)
        render json: conversation, status: :accepted
    end

    # DELETE /conversations/:id
    def destroy
        find_convo.destroy
        head :no_content
    end

    private

    def authorize
        return render json: { error: "Not authorized" }, status: :unauthorized, unless session.include? :user_id
    end

    def convo_params
        params.permit(:title)
    end

    def find_convo
        Conversation.find(params[:id])
    end
end
