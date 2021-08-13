require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!({name: "test", price: 41, quantity: 2}))
  end

  it "renders attributes in <p>" do
    render
  end
end
