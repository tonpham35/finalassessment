require 'rails_helper'

RSpec.describe "investments/index", type: :view do
  before(:each) do
    assign(:investments, [
      Investment.create!(
        :users => "",
        :symbol => "Symbol",
        :quantity => 2,
        :cost => 3.5,
        :status => false
      ),
      Investment.create!(
        :users => "",
        :symbol => "Symbol",
        :quantity => 2,
        :cost => 3.5,
        :status => false
      )
    ])
  end

  it "renders a list of investments" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Symbol".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
