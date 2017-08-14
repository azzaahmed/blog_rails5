class CommentsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    #our channel is comments
    # is called whenever a client subscribes to the channel
      stream_from "comments"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
