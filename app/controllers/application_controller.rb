# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def restrict_access
      redirect_to new_user_session_path, alert: 'Please sign in to access this page.'
  end
end
  