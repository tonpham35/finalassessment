require 'rails_helper'

RSpec.describe "investments/show", type: :view do
  before(:each) do
    @investment = assign(:investment, Investment.create!(
      :users => "",
      :symbol => "Symbol",
      :quantity => 2,
      :cost => 3.5,
      :status => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Symbol/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/false/)
  end
end
