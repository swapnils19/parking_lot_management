# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :set_car, only: %i[show destroy]

  # GET /cars or /cars.json
  def index
    @colors = Car.select(:color).group(:color)

    if params[:color].present?
      @cars = Car.where(color: params[:color])
      return
    end

    @cars = Car.includes(:ticket)
  end

  # GET /cars/1 or /cars/1.json
  def show; end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to car_url(@car), notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:color, :registration_no)
  end
end
