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
  end
end