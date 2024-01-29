require 'rails_helper'

RSpec.describe SignupController, type: :controller do
    let(:user) { create(:user, :admin) }
    describe 'DELETE #destroy' do
        it 'destroys the user and redirects to user_path with a notice' do
        sign_in user

        expect do
            delete :destroy, params: { id: 1 }
        end.to change(User, :count).by(-1)

        expect(response).to redirect_to(user_path)
        expect(flash[:notice]).to eq('User was successfully deleted.')
        end
    end
end
