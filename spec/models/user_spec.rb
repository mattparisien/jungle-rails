require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "is a valid user" do
      user = User.new(
        name: 'name',
        email: 'hello@testing.com',
        password: 'lovebird',
        password_confirmation: 'lovebird'
      )
      expect(user).to be_valid
    end

    it "is tests for password min length" do
         user = User.new
         user.name = "Matt"
         user.email = 'hello@testing.com'
         user.password = 'bird'
         user.password_confirmation = 'bird'
         expect(user).to be_invalid
         
         user = User.new
         user.name = "name"
         user.email = 'test@test.com'
         user.password = 'lovebird'
         user.password_confirmation = 'lovebird'
         expect(user).to be_valid
    end

  end
  
end