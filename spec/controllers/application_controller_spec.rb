# spec/controllers/application_controller_spec.rb
require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    before_action :authenticate_user!

    def index
      render plain: 'Welcome to the index page'
    end

    def restrict_access
      redirect_to new_user_session_path, alert: 'You need to Sign Up for accessing further.'
    end
  end

  describe '#index' do
    before do
      # Stub the authenticate_user! method to skip its execution during the test
      allow_any_instance_of(ApplicationController).to receive(:authenticate_user!)
    end

    it 'redirects to new_user_session_path with the correct alert message when user is not authenticated' do
      get :index

      expect(response).to redirect_to(new_user_session_path)
      expect(flash[:alert]).to eq('You need to Sign Up for accessing further.')
    end

    it 'renders the index page when user is authenticated' do
      # Simulate an authenticated user
      sign_in create(:user)  # Adjust this line based on your authentication setup

      get :index

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq('Welcome to the index page')
    end
  end
end
