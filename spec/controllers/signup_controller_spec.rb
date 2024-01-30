# spec/controllers/signup_controller_spec.rb

require 'rails_helper'

RSpec.describe SignupController, type: :controller do
    let(:user) { create(:user) } # Assuming you have a factory for User model, replace this with your actual factory

    describe 'POST #create' do
        it 'creates a new session (signs in)' do
        @request.env["devise.mapping"] = Devise.mappings[:user] # Set the devise.mapping explicitly
        post :create, params: { user: { email: user.email, password: user.password } }
        expect(response).to redirect_to(root_path) # Adjust the expected redirection path as needed
        expect(flash[:notice]).to eq('Signed in successfully.') # Adjust the flash message as needed
        end
    end

    def destroy 
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_path, notice: 'User was successfully deleted.'
    end
end
