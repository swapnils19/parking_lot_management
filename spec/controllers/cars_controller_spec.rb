require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  def create_cars_with_colors
    color_list = (1..4).map { Faker::Color.color_name }
    color_list.each do |c|
      Car.create(color: c, registration_no: Faker::Alphanumeric.alphanumeric(number: 10))
    end
    color_list
  end

  describe 'GET #index' do
    context 'color filter not applied' do
      it 'returns all cars' do
        create_cars_with_colors
        get :index
        expect(response).to be_successful

        cars = assigns(:cars)
        expect(cars.count).to eq Car.count
      end
    end

    context 'color filter applied' do
      it 'returns filtered cars' do
        color = create_cars_with_colors.sample

        get :index, params: {color: color}
        expect(response).to be_successful

        cars = assigns(:cars)
        expect(cars.count).to eq Car.where(color: color).count
      end
    end
  end
end
