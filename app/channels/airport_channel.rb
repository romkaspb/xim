class AirportChannel < ApplicationCable::Channel
  def subscribed
    stream_from "airport"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
