require 'rails_helper'

RSpec.describe Auth0Helper, type: :helper do
  describe 'logged_in?' do
    it 'returns true if session[:userinfo] is present' do
      session[:userinfo] = 'test'
      expect(helper.logged_in?).to be_truthy
    end

    it 'returns false if no session[:userinfo] is present' do
      expect(helper.logged_in?).to be_falsey
    end
  end

  describe 'username' do
    it 'returns the username from session[:userinfo]' do
      session[:userinfo] = { 'info' => { 'name' => 'username' } }
      expect(helper.username).to eq('username')
    end

    it 'return nil with no session' do
      expect(helper.username).to be_nil
    end
  end

  describe 'gravatar_image' do
    it 'returns the gravatar_url from session[:userinfo]' do
      url = 'https://gravatar.com/test.jpg'
      session[:userinfo] = { 'info' => { 'name' => 'username', 'image' => url } }
      expect(helper.gravatar_image).to eq(url)
    end

    it 'return nil with no session' do
      expect(helper.gravatar_image).to be_nil
    end
  end
end
