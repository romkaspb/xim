class StatusLogsController < ApplicationController
  before_action :set_plane, only: [:index]
  layout false

  def index
    @status_logs = @plane.status_logs
  end

  private
    def set_plane
      @plane = Plane.find(params[:plane_id])
    end
end
