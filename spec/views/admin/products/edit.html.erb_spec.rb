require 'rails_helper'

RSpec.describe "/admin/products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!({name:'test',price: 5,quantity: 5}))
  end

  it "renders the edit product form" do
    render
  end
end
