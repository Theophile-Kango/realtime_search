class SearchLogsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "SearchLogsChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
