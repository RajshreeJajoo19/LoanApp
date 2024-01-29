require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  let(:user) { create(:user) }

        describe 'GET #index' do
            it 'renders the index template for admin user' do
                sign_in create(:user, :admin) 
                get :index
                expect(response).to render_template(:index)
            end

            it 'renders the index template for applicant user' do
                sign_in user
                user.applicant!
                get :index
                expect(response).to render_template(:index)
            end
        end

        describe 'GET #show' do
            it 'renders the show template' do 
            loan = create(:loan, user: user)   
            sign_in user
            get :show, params: { id: loan.id }
            expect(response).to render_template(:show)
            end
        end

        describe 'GET #new' do
            it 'renders the new template' do
                sign_in user 
                get :new
                expect(response).to render_template(:new)
            end
        end

        describe 'POST #create' do
            it 'creates a new loan' do 
                sign_in user
                loan_params = attributes_for(:loan)
                post :create, params: { loan: loan_params }
                expect(response).to redirect_to(loans_path)
                expect(flash[:notice]).to be_present
            end
    
            it 'renders new template on failure' do
                sign_in user
                invalid_loan_params = { invalid_params: 'invalid' }
                post :create, params: { loan: invalid_loan_params }     
                expect(response).to redirect_to(new_loan_path)
                expect(flash[:alert]).to be_present
            end
        end

        describe 'GET #edit' do
            it 'renders the edit template' do     
                loan = create(:loan, user: user)     
                sign_in user
                get :edit, params: { id: loan.id }
                expect(response).to render_template(:edit)
            end
        end

        describe 'PATCH #update' do
            it 'updates the loan' do  
                loan = create(:loan, user: user, name: 'Valid Name')  
                sign_in user
                patch :update, params: { id: loan.id, loan: { amount: 1000 } }
                expect(response).to redirect_to(loans_path)
                expect(flash[:notice]).to be_present
                loan.reload
                expect(loan.amount).to eq(1000)
            end

            it 'renders edit template on failure' do       
                loan = create(:loan, user: user, name: 'Short') 
                sign_in user        
                invalid_loan_params = { name: 'Short' }             
                allow_any_instance_of(Loan).to receive(:save).and_return(false)          
                patch :update, params: { id: loan.id, loan: invalid_loan_params }        
                expect(response).to redirect_to(loans_path)
            end
        end

        describe 'DELETE #destroy' do
            it 'deletes the loan' do
                loan = create(:loan, user: user)
                sign_in user
                delete :destroy, params: { id: loan.id }
                expect(response)
                expect(flash[:notice]).to be_present
                # expect { loan.reload }.to raise_error(ActiveRecord::RecordNotFound)
            end
        end
    
    

end
