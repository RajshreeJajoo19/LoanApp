require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe CustomSessionsController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }
    
    it 'redirects to loans_path if user_role is true' do
      request.env["devise.mapping"] = Devise.mappings[:user]
      allow(controller).to receive(:resource) { user }
      allow(user).to receive(:user_role?).and_return(true)
      post :create, params: {
        user: {
          email: user.email,
          password: user.password,
        }
      }
      expect(response).to redirect_to(loans_path)
    end

    it 'renders the default action if user_role is false' do
      request.env["devise.mapping"] = Devise.mappings[:user]
      allow(controller).to receive(:resource) { user }
      allow(user).to receive(:user_role?).and_return(false)

      post :create

      expect(response).to render_template(:new)
    end
  end

  describe 'DELETE #destroy' do
    it 'signs the user out and redirects to the root path' do
      request.env["devise.mapping"] = Devise.mappings[:user]
      user = create(:user)
      sign_in user

      delete :destroy

      expect(response).to redirect_to(root_path)
      expect(controller.current_user).to be_nil
    end
  end
end
