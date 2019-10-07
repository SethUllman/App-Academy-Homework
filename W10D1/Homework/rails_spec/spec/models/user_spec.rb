require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  subject(:user) do 
    FactoryBot.create(:user, 
    email: "maverick18@gmail.com", 
    password: "hotstuff")
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password) }
  end

  describe 'is_password?' do
    it 'verifies if a password is correct' do
      expect(user.is_password?("hotstuff")).to be true
    end

    it 'verifies if a password is not correct' do
      expect(user.is_password?("coldstuff")).to be false
    end
  end

  describe 'reset_session_token' do
    it 'sets a new session token' do
      user.valid?
      old_token = user.session_token 
      user.reset_session_token!

      expect(user.session_token).not_to eq(old_token)
    end

    it 'returns new token' do
      user.valid?
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe 'self.find_by_credentials' do
    it 'returns user if exists' do
      user.save
      found_user = (
        User.find_by_credentials("maverick18@gmail.com", "hotstuff")
      )
      expect(found_user).to eq(user)
    end

    it 'returns nil if user does not exit' do
      user.save
      found_user = (
        User.find_by_credentials("notanemail@hotmail.com", "coldstuff")
      )
      expect(found_user).to eq(nil)
    end
  end


end
