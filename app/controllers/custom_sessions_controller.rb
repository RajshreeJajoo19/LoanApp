class CustomSessionsController < Devise::SessionsController
    def destroy
      super do
        puts "HI there!"
        # redirect_to loans_path
      end
    end
end