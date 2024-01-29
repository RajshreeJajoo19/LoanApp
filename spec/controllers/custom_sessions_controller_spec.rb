require 'rails_helper'

RSpec.describe CustomSessionsController, type: :controller do

  describe 'POST #create' do

      let(:admin_user) { create(:user, :admin) }
      let(:applicant_user) { create(:user) } 
      context 'when user_role? returns true' do
        let(:user_role_check_result) { true }
          it 'redirects to loans_path' do
              post :create
              expect(response).to redirect_to(loans_path)
          end
      end

      # context 'when user_role? returns false' do
      #   let(:user_role_check_result) { false }
      #   it 'does not redirect' do
      #     post :create
      #     expect(response).not_to redirect_to(loans_path)
      #   end
      # end
  end

end
