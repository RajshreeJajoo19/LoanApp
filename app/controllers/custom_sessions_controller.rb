class CustomSessionsController < Devise::SessionsController
    def destroy
      super do
        puts "HI there!"
        # redirect_to loans_path
      end
    end


    def create
      super do |resource|
        if resource.user_role == 2
          redirect_to loans_path and return
        end
      end
    end


end