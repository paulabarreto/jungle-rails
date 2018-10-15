require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { described_class.new }

  describe 'Validations' do
    # validation tests/examples here
    it "is valid with valid attributes" do
      @category = Category.new
      @product = @category.products.new
      @product.name = "Anything"
      @product.price = 0
      @product.quantity = 0
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @category = Category.new
      @product = @category.products.new
      @product.name = nil
      @product.price = 0
      @product.quantity = 0
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @category = Category.new
      @product = @category.products.new
      @product.name = "Anything"
      @product.price = nil
      @product.quantity = 0
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @category = Category.new
      @product = @category.products.new
      @product.name = "Anything"
      @product.price = 0
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @product = Product.new
      @product.name = "Anything"
      @product.price = 0
      @product.quantity = 0
      expect(@product).to_not be_valid
    end

  end
end
