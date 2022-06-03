require 'rails_helper'

RSpec.describe "entrances/index", type: :view do
  before(:each) do
    assign(:entrances, [
      Entrance.create!(
        parking_lot: nil
      ),
      Entrance.create!(
        parking_lot: nil
      )
    ])
  end

  it "renders a list of entrances" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
