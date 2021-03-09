require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do 
      @category = Category.new(name: "Winter Clothes")
      @product = Product.new(
        name: "Sweater",
        category: @category,
        description: "a warm sweater",
        quantity: 10,
        price: 2500, 
        image:'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
      )
      @product.save!
      expect(@product).to be_valid
    end
  end
  describe 'Validations' do
    it "is invalid with no name" do 
      @category = Category.new(name: "Winter Clothes")
      @product = Product.new(
        name: nil,
        category: @category,
        description: "a warm sweater",
        quantity: 10,
        price: 2500, 
        image:'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
      )
      @product.save
      expect(@product).to_not be_valid
    end
  end
  describe 'Validations' do
    it "is invalid with no category" do 
      @category = Category.new(name: "Winter Clothes")
      @product = Product.new(
        name: "Sweater",
        category: nil,
        description: "a warm sweater",
        quantity: 10,
        price: 2500, 
        image:'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
      )
      @product.save
      expect(@product).to_not be_valid
    end
  end
  describe 'Validations' do
    it "is invalid with no price" do 
      @category = Category.new(name: "Winter Clothes")
      @product = Product.new(
        name: "Sweater",
        category: @category,
        description: "a warm sweater",
        quantity: 10,
        price: nil, 
        image:'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
      )
      @product.save
      expect(@product).to_not be_valid
    end
  end
  describe 'Validations' do
    it "is invalid with no quantity" do 
      @category = Category.new(name: "Winter Clothes")
      @product = Product.new(
        name: "Sweater",
        category: @category,
        description: "a warm sweater",
        quantity: nil,
        price: 2500, 
        image:'https://images.pexels.com/photos/996329/pexels-photo-996329.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'
      )
      @product.save
      expect(@product).to_not be_valid
    end
  end
end
