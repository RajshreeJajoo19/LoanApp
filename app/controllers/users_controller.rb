class UsersController < ApplicationController

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

end
