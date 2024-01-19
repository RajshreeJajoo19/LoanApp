class SignupController < Devise::RegistrationsController
    def after_sign_up_path_for(resource)
      loans_path
    end
    

    def destroy 
      @user = User.find(params[:id])
      @user.destroy
      redirect_to user_path, notice: 'User was successfully deleted.'
   end

end