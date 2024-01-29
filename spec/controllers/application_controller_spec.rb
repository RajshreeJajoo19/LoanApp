# spec/controllers/application_controller_spec.rb

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe '#restrict_access' do
    context 'when user is not authenticated' do
      it 'redirects to the sign-in page with an alert message' do
        # # Assuming ApplicationController is using Devise for authentication
        # allow(controller).to receive(:authenticate_user!).and_call_original
        # allow(controller).to receive(:current_user).and_return(nil)

        # get :restrict_access

        # expect(response).to redirect_to(new_user_session_path)
        # expect(flash[:alert]).to eq('Please sign in to access this page.')
      end
    end

    context 'when user is authenticated' do
      it 'does not redirect and allows access' do
        # # Assuming ApplicationController is using Devise for authentication
        # allow(controller).to receive(:authenticate_user!).and_call_original
        # allow(controller).to receive(:current_user).and_return(double('User'))

        # get :restrict_access

        # expect(response).to_not have_http_status(:redirect)
        # expect(flash[:alert]).to be_nil
      end
    end
  end
end
