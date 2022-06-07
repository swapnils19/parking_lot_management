require 'rails_helper'

RSpec.describe "tickets/new", type: :view do
  before(:each) do
    assign(:ticket, Ticket.new(
      parking_lot: nil,
      car: nil,
      spot: nil
    ))
  end

  it "renders new ticket form" do
    render

    assert_select "form[action=?][method=?]", tickets_path, "post" do

      assert_select "input[name=?]", "ticket[parking_lot_id]"

      assert_select "input[name=?]", "ticket[car_id]"

      assert_select "input[name=?]", "ticket[spot_id]"
    end
  end
end
