require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:admin_user) { create(:user, :admin) }
    let(:applicant_user) { create(:user) } # User with default role
    let(:user_with_reset_password_token) { create(:user, :with_reset_password_token) }

    describe 'GET #index' do
      context 'when user is an admin' do
        before { sign_in admin_user }
        it 'renders the index template' do
          get :index
          expect(response).to have_http_status(200)
          expect(response).to render_template(:index)
        end
      end
  
      context 'when user is not an admin' do
        it 'redirects to the root path' do
          sign_in applicant_user
          get :index
          expect(response).to redirect_to(root_path)
        end
      end
    end  

    describe 'DELETE #destroy' do
      context 'when user is an admin' do
        before { sign_in admin_user }
  
        it 'destroys the user if no active loans' do
          user = create(:user)
          puts "User ID created: #{user.id}" if user.persisted?
          delete :destroy, params: { id: 1 }
          expect(flash[:notice]).to eq('User was successfully deleted.')
        end
  
        it 'redirects with alert if user has active loans' do
          user_with_loans = create(:user, :with_loans)
          delete :destroy, params: { id: user_with_loans.id }
          expect(response).to_not redirect_to(new_user_session_path)
          expect(flash[:alert]).to eq('The user has active loan application. So, cannot be deleted.')
        end
      end
  
      context 'when user is not an admin' do
        it 'redirects to the root path' do
          sign_in applicant_user
          delete :destroy, params: { id: applicant_user.id }
          expect(response).to redirect_to(root_path)
        end
      end
    end
end
