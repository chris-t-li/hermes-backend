class ParticipantsController < ApplicationController

    # GET /myconversations
    def show_my_convos
        # user = User.find_by(username: session[:username])
        # byebug
        user = User.find_by(username: params[:user])
        convo_id_array = Participant.where(user: user).map{|p| p.conversation_id}
        render json: Conversation.find(convo_id_array), status: :ok
    end

end
