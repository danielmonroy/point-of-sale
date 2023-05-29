class WorkingStationsController < ApplicationController
  before_action :authenticate_user!

  # POST /working_stations or /working_stations.json
  def create
    @working_station = WorkingStation.new(working_station_params)
    @working_station.store_id = current_user.store_id

    respond_to do |format|
      if @working_station.save
        format.html { redirect_to products_path, notice: "Nueva estación de trabajo creada con éxito." }
        format.json { render :show, status: :created, location: @working_station }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @working_station.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def working_station_params
      params.require(:working_station).permit(:name, :store_id)
    end
end
