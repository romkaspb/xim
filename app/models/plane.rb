class Plane < ApplicationRecord
  include Statusable
  scope :flyable, -> { where(status: :shed) }

  has_many :status_logs

  after_update :create_status_log, :notify_ws, if: ->(p){ p.status_changed? }

  def create_status_log
    status_logs.create(status: status_was)
  end

  def flyaway
    $redis_airport.rpush("runway", id)
    update_attribute(:status, :waiting)
    SendPlaneJob.perform_later if $redis_airport.llen("runway") == 1
  end

  def notify_ws
    ActionCable.server.broadcast(
      "airport",
      plane_id: id,
      status: status.humanize
    )
  end
end
