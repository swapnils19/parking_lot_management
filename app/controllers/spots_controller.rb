class SpotsController < ApplicationController
  before_action :set_parking_lot
  before_action :set_spot, only: :destroy

  def index
    @spots = @parking_lot.spots.includes(:nearest_entrance).all
  end

  def new
    @spot = @parking_lot.spots.build
  end

  def create
    @spot = @parking_lot.spots.build(spot_params)

    respond_to do |format|
      if @spot.save
        format.html { redirect_to parking_lot_spots_url, notice: 'Spot was successfully created.' }
        format.json { render :show, status: :created, location: @spot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @spot.destroy

    respond_to do |format|
      format.html { redirect_to parking_lot_spots_url, notice: 'Spot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:entrance_id)
  end

  def set_parking_lot
    @parking_lot = ParkingLot.find(params[:parking_lot_id])
  end

  def set_spot
    @spot = @parking_lot.spots.find(params[:id])
  end
end
