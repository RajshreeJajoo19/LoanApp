# frozen_string_literal: true

# spec/controllers/users/unlocks_controller_spec.rb

require 'rails_helper'

RSpec.describe Users::UnlocksController, type: :controller do
  let(:user) { create(:user, locked_at: 1.day.ago) } # Assuming you have FactoryBot for creating users

  describe 'GET #new' do
    it 'renders the new template' do
      #   get :new
      #   expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'sends unlock instructions to the user' do
      #   post :create, params: { user: { email: user.email } }
      #   expect(response).to redirect_to(root_path)
      #   expect(flash[:notice]).to eq(
      #     'If your account exists, you will receive an email ' \
      #     'with instructions for how to unlock it shortly.'
      #   )
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      #   user.send_unlock_instructions
      #   get :show, params: { unlock_token: user.unlock_token }
      #   expect(response).to render_template(:show)
    end
  end

  # Add more test cases for other actions as needed
end
