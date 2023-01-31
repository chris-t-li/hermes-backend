class MessageFeedChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    puts 'subbed' * 10
    p params
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
