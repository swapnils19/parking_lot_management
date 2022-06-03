require 'rails_helper'

RSpec.describe "entrances/new", type: :view do
  before(:each) do
    assign(:entrance, Entrance.new(
      parking_lot: nil
    ))
  end

  it "renders new entrance form" do
    render

    assert_select "form[action=?][method=?]", entrances_path, "post" do

      assert_select "input[name=?]", "entrance[parking_lot_id]"
    end
  end
end
