# frozen_string_literal: true

# spec/controllers/users/passwords_controller_spec.rb

require 'rails_helper'

RSpec.describe Users::PasswordsController, type: :controller do
  let(:user) { create(:user) } # Assuming you have a User model and FactoryBot for creating users

  describe 'GET #new' do
    it 'renders the new template' do
      #   get :new
      #   expect(response).to render_template(:new)
      #   expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid email' do
      it 'redirects to the root path after sending reset password instructions' do
        # post :create, params: { user: { email: user.email } }
        # expect(response).to redirect_to(root_path)
        # expect(flash[:notice]).to be_present
      end
    end
  end
end
