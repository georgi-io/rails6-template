require 'rails_helper'

RSpec.describe Auth0Controller, type: :controller do
  include Auth0Helper

  describe 'GET callback' do
    before(:each) {
      mock_auth = OmniAuth.config.mock_auth
      mock_auth[:default]['info']['email'] = 'sebastian@georgi.io'
      request.env['omniauth.auth'] = mock_auth[:default]
    }
    it 'sets session[:user_id] with something' do
      get :callback
      expect(session[:user_id]).not_to be_nil
    end

    it 'redirects to :application_index' do
      get :callback
      expect(response).to redirect_to(application_index_path)
    end
  end

  describe 'GET logout' do
    let(:logout_url_string) { logout_url.to_s }
    it 'resets the session' do
      session[:user_id] = '1'
      get :logout
      expect(session[:user_id]).to be_nil
    end

    it 'redirects to Auth0 logout' do
      get :logout
      expect(response).to redirect_to(logout_url_string)
    end
  end
end
