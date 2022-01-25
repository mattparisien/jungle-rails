require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "is a valid user" do
      user = User.new(
        name: 'user_name',
        email: 'hello@testing.com',
        password: 'lovebird',
        password_confirmation: 'lovebird'
      )
      expect(user).to be_valid
    end

  end
  
end