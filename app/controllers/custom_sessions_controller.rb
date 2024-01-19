class CustomSessionsController < Devise::SessionsController
    def destroy
      super do
      end
    end

    def create
      super do |resource|
        if resource.user_role?
          redirect_to loans_path and return
        end
      end
    end
end