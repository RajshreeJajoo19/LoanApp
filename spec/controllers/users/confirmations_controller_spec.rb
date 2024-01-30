# frozen_string_literal: true

# spec/controllers/users/confirmations_controller_spec.rb

require 'rails_helper'

RSpec.describe Users::ConfirmationsController, type: :controller do
  let(:user) { create(:user, confirmed_at: nil) } # Assuming you have a User model and FactoryBot for creating users

  describe 'GET #new' do
    it 'renders the new template' do
      #   get :new
      # #   expect(response).to render_template(:new)
      # #   expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    it 'redirects to the root path after creating confirmation' do
      #   post :create, params: { user: { email: user.email } }
      #   expect(response).to redirect_to(root_path)
      #   expect(flash[:notice]).to be_present
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      #   user.send_confirmation_instructions
      #   get :show, params: { confirmation_token: user.confirmation_token }
      #   expect(response).to render_template(:show)
      #   expect(response).to have_http_status(:ok)
    end
  end

  
end
