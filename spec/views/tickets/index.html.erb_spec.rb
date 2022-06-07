require 'rails_helper'

RSpec.describe "tickets/index", type: :view do
  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        parking_lot: nil,
        car: nil,
        spot: nil
      ),
      Ticket.create!(
        parking_lot: nil,
        car: nil,
        spot: nil
      )
    ])
  end

  it "renders a list of tickets" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
