class FloorController < ApplicationController
  before_action :set_parking_lot
  before_action :set_floor, only: :destroy

  # GET /floors or /floors.json
  def index
    @floors = @parking_lot.floors.all
  end

  # GET /floors/new
  def new
    @floor = @parking_lot.floors.build
  end

  # POST /floors or /floors.json
  def create
    @floor = @parking_lot.floors.build(floor_params)

    respond_to do |format|
      if @floor.save
        format.html { redirect_to parking_lot_floors_url, notice: 'floor was successfully created.' }
        format.json { render :show, status: :created, location: @floor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @floor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /floors/1 or /floors/1.json
  def destroy
    @floor.destroy

    respond_to do |format|
      format.html { redirect_to parking_lot_floors_url, notice: 'floor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_floor
    @floor = @parking_lot.floors.find(params[:id])
  end

  def set_parking_lot
    @parking_lot = ParkingLot.find(params[:parking_lot_id])
  end

  def floor_params
    params.require(:floor).permit(:max_spots)
  end
end
