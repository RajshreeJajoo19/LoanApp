
require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET #home" do
    it "renders the home template when user is signed in" do
      user = create(:user) 
      sign_in user          

      get :home
      expect(response).to render_template("home")
    end

    it "redirects to sign-in when user is not signed in" do
      get :home
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
