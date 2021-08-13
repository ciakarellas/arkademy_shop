require 'rails_helper'

RSpec.describe Product, type: :model do
  context "when data provided is valid" do
    let(:params) {{name: "New name", price: 47.8, quantity: 2}}

    it 'saves the instance' do
      expect(described_class.new(params).save!).to eq true
    end

    it {expect {described_class.new(params).save!}.to change {Product.all.size}.by(1) }
  end

  context "when data provided is invalid" do
    let(:params) {{name: '', price: 50.0, quantity: 2}}
    it "error when name is missing" do
      expect { described_class.new(params).save!}.to raise_error("Validation failed: Name can't be blank")  
    end
  end

  # look that above example and below in different way save data first we write described_class.new(params).save!
  # secodn write like this described_class.create!(params). Both are correct
  context "when data provided is invalid" do
    let(:params) {{name: 'example name', price: nil, quantity: 2}}
    it "error when no title" do
      expect { described_class.create!(params)}.to raise_error("Validation failed: Price can't be blank")  
    end
  end

  context "when data provided is invalid" do
    let(:params) {{name: 'example name', price: 2, quantity: nil}}
    it "error when no title" do
      expect { described_class.new(params).save!}.to raise_error("Validation failed: Quantity can't be blank")  
    end
  end
  
  context "when all params are missing" do
    let(:params){{name: '', price: nil, quantity:nil}}\
    
    it 'throws an explicit error' do
      expect { described_class.create!(params)}.to raise_error("Validation failed: Name can't be blank, Price can't be blank, Quantity can't be blank")  
    end
  end
  
end
