require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do

    #validates :category, presence: true
    it "is a valid product with the correct details" do
      category = Category.new(name: 'Electronics')
      product = Product.new(
        name:  'Modern Skateboards',
        description: "Banjo post-ironic intelligentsia. Irony ramps austin. Slow-carb drinking whatever sartorial seitan occupy. Seitan street mixtape.",
        category: category,
        quantity: 40,
        price: 164.49
      )
      expect(product).to be_valid
    end

    #validates :name, presence: true
    it "should fail if the product has no name" do
      category = Category.new(name: 'Electronics')
      product = Product.new(
        name:  nil,
        description: "Banjo post-ironic intelligentsia. Irony ramps austin. Slow-carb drinking whatever sartorial seitan occupy. Seitan street mixtape.",
        category: category,
        quantity: 40,
        price: 164.49
      )
      expect(product).to be_valid
    end

  
    #validates :quantity, presence: true
    it "should fail if the product has no quantity" do
      category = Category.new(name: 'Electronics')
      product = Product.new(
        name:  'Modern Skateboards',
        description: "Banjo post-ironic intelligentsia. Irony ramps austin. Slow-carb drinking whatever sartorial seitan occupy. Seitan street mixtape.",
        category: category,
        quantity: nil,
        price: 164.49
      )
      expect(product).to be_valid
    end

    #validates :category, presence: true
    it "should fail if the product has no category" do
      category = Category.new(name: 'Electronics')
      product = Product.new(
        name:  'Modern Skateboards',
        description: "Banjo post-ironic intelligentsia. Irony ramps austin. Slow-carb drinking whatever sartorial seitan occupy. Seitan street mixtape.",
        category: nil,
        quantity: 40,
        price: 164.49
      )
      expect(product).to be_valid
    end


  end
end