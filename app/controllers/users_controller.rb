class UsersController < ApplicationController
   
  helper_method :role_button_text
  before_action :check_admin_role, only: [:index, :destroy]

  def index
      @users = User.all
  end

  def destroy 
      @user = User.find(params[:id])
      if @user.loans.any?
          redirect_to user_path, flash: { alert: 'The user has active loan application. So, cannot be deleted.' }
      else
          @user.destroy
          redirect_to user_path, flash: { notice: 'User was successfully deleted.' }
      end
  end

  def update_role
      @user = User.find(params[:id])
      @user.update(user_role: (@user.applicant? ? 2 : 1))
      redirect_to users_path, notice: 'User role updated successfully.'
  end

  private

  def role_button_text(user)
      user.applicant? ? 'Make Admin' : 'Make Applicant'
  end

  def check_admin_role
      unless current_user.admin?
          flash[:alert] = 'You do not have permission to access this page.'
          redirect_to root_path
      end
  end

end