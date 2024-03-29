require 'rails_helper'
# Assuming your controller is named UsersController
RSpec.describe UsersController, type: :controller do
    describe 'GET #index' do
        it 'returns a successful response' do
        get :index
        expect(response).to be_successful
        end

        it 'assigns all users to @users' do
        user1 = create(:user, email: 'vijendra@gmail.com', encrypted_password: 'test123')
        get :index
        expect(assigns(:users)).to eq([user1])
        end
     end
  end