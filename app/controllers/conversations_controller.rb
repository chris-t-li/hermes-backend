class ConversationsController < ApplicationController
    # before_action :authorize

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
        isExist = Conversation.all.map{|c| c.participants}.map{|pArr| pArr.map{|p| p.user_id}.sort}.include?(params[:participants].sort)
        
        if isExist 
            render json: {error: "Convo already exists"}, status: :unprocessable_entity
        else
            conversation = Conversation.create!(convo_params)
                
            params[:participants].each do |userID| 
                # params[:participants] is an array of participant user IDs provided from the frontend. This will need to include the logged in user (seession[:user_id])
                Participant.create!(user_id: userID, conversation_id: conversation.id) 
            end
            # Current app constraint. Needs to initialize a message when creating conversation and participants. Otherwise unable to render.
            Message.create(content: "[...Start chat here...]", conversation_id: conversation.id, user_id: session[:user_id])
            byebug
            render json: conversation, serializer: NewConversationSerializer, status: :created
        end
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
        byebug
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :username
    end

    def convo_params
        params.permit(:title, :participants, :convo_url)
    end

    def find_convo
        Conversation.find(params[:id])
    end
end
