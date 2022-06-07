require 'rails_helper'

RSpec.describe "tickets/edit", type: :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      parking_lot: nil,
      car: nil,
      spot: nil
    ))
  end

  it "renders the edit ticket form" do
    render

    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do

      assert_select "input[name=?]", "ticket[parking_lot_id]"

      assert_select "input[name=?]", "ticket[car_id]"

      assert_select "input[name=?]", "ticket[spot_id]"
    end
  end
end
