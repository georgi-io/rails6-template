require 'rails_helper'

RSpec.describe Auth0Controller, type: :controller do
  include Auth0Helper

  describe 'GET callback' do
    before(:each) { request.env['omniauth.auth'] = OmniAuth.config.mock_auth }
    it 'sets session[:userinfo] with omniauth.auth request.env' do
      get :callback
      expect(session[:userinfo]).to eq(OmniAuth.config.mock_auth)
    end

    it 'redirects to :application_index' do
      get :callback
      expect(response).to redirect_to(application_index_path)
    end
  end

  describe 'GET logout' do
    let(:logout_url_string) { logout_url.to_s }
    it 'resets the session' do
      session[:userinfo] = 'bla'
      get :logout
      expect(session[:userinfo]).to be_nil
    end

    it 'redirects to Auth0 logout' do
      get :logout
      expect(response).to redirect_to(logout_url_string)
    end
  end
end
