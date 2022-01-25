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
         user.email = 'hello@testing.com'
         user.password = 'lovebird'
         user.password_confirmation = 'lovebird'
         expect(user).to be_valid
    end

  end


  it 'checks to see if email does not exist in database' do
    user = User.new
    user.name = 'name'
    user.email = 'hello@testing.com'
    user.password = 'lovebird'
    user.password_confirmation = 'lovebird'

    user.save
  
    anotherUser = User.new
    anotherUser.name = 'name'
    anotherUser.email = 'hello@testing.com'
    anotherUser.password = 'lovebird'
    anotherUser.password_confirmation = 'lovebird'

    anotherUser.save
  
    expect(anotherUser).to be_invalid
  end

  it 'checks to see if passwords do not match' do
    user = User.new(
        name: 'testName',
        email: 'hello@testing.com',
        password: 'lovebird',
        password_confirmation: 'lovebirdsss'
      )
      user.valid?
      expect(user.errors[:password_confirmation]).to be_present
  end


  describe '.authenticate_with_credentials' do
    it 'should fail if the email and password do not correspond to a user' do
      user = User.new(
        name: 'name',
        email: 'hello@testing.com',
        password: 'lovebird',
        password_confirmation: 'lovebird'
      )
      user.save
  
      user = User.authenticate_with_credentials('hey@google.com', 'lovebird')
      expect(user).to be(nil)
    end
  
    it 'should pass if the email and password correspond to a user in db' do
      user = User.new(
        name: 'name',
        email: 'hello@testing.com',
        password: 'lovebird',
        password_confirmation: 'lovebird'
      )
      user.save
  
      user = User.authenticate_with_credentials('hello@testing.com', 'lovebird')
      expect(user).not_to be(nil)
    end

    it 'should not fail when spaces exist in email' do
      user = User.new(
        name: 'testName',
        email: 'hello@testing.com',
        password: 'lovebird',
        password_confirmation: 'lovebird'
      )
      user.save
  
      user = User.authenticate_with_credentials('  hello@testing.com ', 'lovebird')
      expect(user).not_to be(nil)
    end

    it 'should not fail with caps in email' do
      user = User.new(
        name: 'name',
        email: 'hello@testing.com',
        password: 'lovebird',
        password_confirmation: 'lovebird'
      )
      user.save
  
      user = User.authenticate_with_credentials('HeLLO@tEstING.com', 'lovebird')
      expect(user).not_to be(nil)
    end
  end
end