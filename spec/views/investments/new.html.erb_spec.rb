require 'rails_helper'

RSpec.describe "investments/new", type: :view do
  before(:each) do
    assign(:investment, Investment.new(
      :users => "",
      :symbol => "MyString",
      :quantity => 1,
      :cost => 1.5,
      :status => false
    ))
  end

  it "renders new investment form" do
    render

    assert_select "form[action=?][method=?]", investments_path, "post" do

      assert_select "input[name=?]", "investment[users]"

      assert_select "input[name=?]", "investment[symbol]"

      assert_select "input[name=?]", "investment[quantity]"

      assert_select "input[name=?]", "investment[cost]"

      assert_select "input[name=?]", "investment[status]"
    end
  end
end
