class MessageFeedChannel < ApplicationCable::Channel
  def subscribed
    puts 'subbed' * 10
    p params
    # subscribe to specific user's message feed
    user = User.find_by(id: params[:user_id])
    stream_for user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
