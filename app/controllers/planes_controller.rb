class PlanesController < ApplicationController
  before_action :set_plane, only: [:fly]
  before_action :set_planes, only: [:flyall]
  def index
    @planes = Plane.order(:name)
  end

  def fly
    @plane.flyaway
    head :ok
  end

  def flyall
    @planes.map{|p| p.flyaway }
    head :ok
  end

  private
    def set_plane
      begin
        @plane = Plane.flyable.find(params[:id])
      rescue
        head :not_found
      end
    end

    def set_planes
      @planes = Plane.flyable.where(id: params[:ids].split(','))
      head :not_found unless @planes.any?
    end
end
