require 'rails_helper'

RSpec.describe "cars/show", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      color: "Color",
      registration_no: "Registration No"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/Registration No/)
  end
end
