require 'rails_helper'

RSpec.describe User, type: :model do
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password',
                                       password_confirmation: 'password')

  before(:each) do
    @user1 = User.new(email: 'test1')
  end
  context 'validation tests' do
    it ' ensures name not blank' do
      user = User.new(email: '').save
      expect(user).to eql(false)
    end
    it 'ensures length of email should at least 3' do
      user = User.new(email: 'c').save
      expect(user).to eql(false)
    end
    it 'creates a user only if the name is unique' do
      @user1.save
      @user2 = User.create(email: @user1.email.to_s)
      expect(@user2.valid?).to eq false
    end
  end

  describe 'associations' do
    it ' create user with valid attributes' do
      expect(current_user).to be_valid
    end
    it 'invalid create user without email' do
      current_user.email = ''
      expect(current_user).not_to be_valid
    end
  end
end
