require 'rails_helper'

RSpec.describe Auth0Helper, type: :helper do
  describe '#current_user' do
    it 'returns a user when id in session' do
      user = LocalUser.create!(name: 'Sebastian Georgi', email: 'sebastian@georgi.io', auth0_id: SecureRandom.uuid)
      session[:user_id] = user.id
      expect(helper.current_user.id).to eq user.id
    end

    it 'returns nil if no session[:user_id] is present' do
      expect(helper.current_user).to be_nil
    end
  end

  describe '#user_gravatar' do
    it 'returns the gravatar_url from session[:user_gravatar]' do
      url = 'https://gravatar.com/test.jpg'
      session[:user_id] = 1
      session[:user_gravatar] = url
      expect(helper.user_gravatar).to eq(url)
    end

    it 'return nil with no session' do
      expect(helper.user_gravatar).to be_nil
    end
  end
end
