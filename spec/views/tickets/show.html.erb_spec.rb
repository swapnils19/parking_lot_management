require 'rails_helper'

RSpec.describe "tickets/show", type: :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      parking_lot: nil,
      car: nil,
      spot: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
