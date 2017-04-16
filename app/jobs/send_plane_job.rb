class SendPlaneJob < ApplicationJob
  queue_as :default

  def perform(*args)
    plane_id = $redis_airport.lpop("runway")
    return unless plane_id
    plane = Plane.find(plane_id)
    sleep rand 10..100
    plane.update_attribute(:status, :flewout)
    SendPlaneJob.perform_later
  end
end
