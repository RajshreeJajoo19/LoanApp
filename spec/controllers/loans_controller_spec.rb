require 'rails_helper'
# Assuming your controller is named UsersController
RSpec.describe LoansController, type: :controller do
    describe 'POST #create' do
        context 'with valid attributes' do
            it 'creates a new loan' do
                expect {
                post :create, params: { loan: attributes_for(:loan) }
                }.to change(Loan, :count).by(1)
            end
        end

        context 'with invalid attributes' do
            it 'does not create a new loan' do
                expect {
                post :create, params: { loan: attributes_for(:loan, name: nil) }
                }.to_not change(Loan, :count)
            end
        end
     end
  end