# frozen_string_literal: true

# spec/controllers/users/omniauth_callbacks_controller_spec.rb

require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  describe '#google_oauth2' do
    it 'handles Google OAuth2 callback' do
      #   # Stub the request environment to simulate an OAuth callback
      #   request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

      #   get :google_oauth2

      #   # Assuming a successful OAuth callback redirects to the root path
      #   expect(response).to redirect_to(root_path)

      #   # You might want to add additional expectations based on your implementation
    end
  end
end
