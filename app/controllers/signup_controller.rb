class SignupController < Devise::RegistrationsController

    def destroy 
      @user = User.find(params[:id])
      @user.destroy
      redirect_to user_path, notice: 'User was successfully deleted.'
   end

end