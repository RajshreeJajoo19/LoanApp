class Users::SessionsController < Devise::SessionsController
  def destroy
    super
    
    redirect_to loans_path
  end
end