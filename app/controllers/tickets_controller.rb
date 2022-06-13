# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_parking_lot
  before_action :set_ticket, only: %i[show destroy]

  # GET /tickets or /tickets.json
  def index
    @tickets = @parking_lot.tickets.includes(:car)
  end

  # GET /tickets/1 or /tickets/1.json
  def show; end

  # GET /tickets/new
  def new
    @ticket = @parking_lot.tickets.build
    set_form_collections
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = @parking_lot.tickets.build(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to parking_lot_ticket_url(@parking_lot, @ticket), notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        set_form_collections
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to parking_lot_tickets_url(@parking_lot), notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = @parking_lot.tickets.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ticket_params
    params.require(:ticket).permit(:parking_lot_id, :car_id, :spot_id)
  end

  def set_parking_lot
    @parking_lot = ParkingLot.find(params[:parking_lot_id])
  end

  def set_form_collections
    @available_spots = Spot.free_spots(@parking_lot).select(:id)
    @available_cars = Car.unparked_cars
  end
end
