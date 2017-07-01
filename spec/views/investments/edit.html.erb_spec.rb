require 'rails_helper'

RSpec.describe "investments/edit", type: :view do
  before(:each) do
    @investment = assign(:investment, Investment.create!(
      :users => "",
      :symbol => "MyString",
      :quantity => 1,
      :cost => 1.5,
      :status => false
    ))
  end

  it "renders the edit investment form" do
    render

    assert_select "form[action=?][method=?]", investment_path(@investment), "post" do

      assert_select "input[name=?]", "investment[users]"

      assert_select "input[name=?]", "investment[symbol]"

      assert_select "input[name=?]", "investment[quantity]"

      assert_select "input[name=?]", "investment[cost]"

      assert_select "input[name=?]", "investment[status]"
    end
  end
end
