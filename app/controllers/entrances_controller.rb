class EntrancesController < ApplicationController
  before_action :set_parking_lot
  before_action :set_entrance, only: :destroy

  # GET /entrances or /entrances.json
  def index
    @entrances = @parking_lot.entrances.all
  end

  # GET /entrances/new
  def new
    @entrance = @parking_lot.entrances.build
  end

  # POST /entrances or /entrances.json
  def create
    @entrance = @parking_lot.entrances.build

    respond_to do |format|
      if @entrance.save
        format.html { redirect_to parking_lot_entrances_url, notice: 'Entrance was successfully created.' }
        format.json { render :show, status: :created, location: @entrance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entrance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrances/1 or /entrances/1.json
  def destroy
    @entrance.destroy

    respond_to do |format|
      format.html { redirect_to parking_lot_entrances_url, notice: 'Entrance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_entrance
    @entrance = @parking_lot.entrances.find(params[:id])
  end

  def set_parking_lot
    @parking_lot = ParkingLot.find(params[:parking_lot_id])
  end
end
