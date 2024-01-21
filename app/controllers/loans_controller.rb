class LoansController < ApplicationController

    
    def show
      #debugger
      @loan = Loan.find(params[:id])
      respond_to do |format|
        format.html { render action: "show" }
        format.js { render json: {} }
      end
    end
      

    def index
      if current_user.user_role == 1
        @loans = Loan.where(user_id: current_user.id)
      else
        @loans = Loan.all
      end 
    end


    def new
        @loan = Loan.new
    end


    def edit
        @loan = Loan.find(params[:id])
    end


    # Create action to save data in the Loan model


    # def create
    #     @loan = Loan.new(loan_params)
    #     if @loan.save
    #         flash[:notice] = "Loan application was created successfully"
    #         redirect_to loans_path
    #     else
    #        redirect_to new_loan_path, alert: @loan.errors.full_messages.join(', ')
    #         #render 'new'
    #     end
    # end

    def create
      @loan = Loan.new(loan_params)

      # Set user_id to the current user's ID
      @loan.user_id = current_user.id

      # debugger
      respond_to do |format|
        amount = get_unmasked_value(loan_params[:amount])
        income = get_unmasked_value(loan_params[:income])
      
        @loan.amount = amount.to_i if amount.present?
        @loan.income = income.to_i if income.present?
    
        if @loan.save
          format.html { redirect_to loans_path, notice: "Loan application was created successfully" }
          format.js   { puts "AJAX request succeeded!" }
          format.json { render json: {} }
        else
          format.html { render action: "new" } # You might want to render the 'new' view on failure
          format.json { render json: { errors: @loan.errors.full_messages }, status: :unprocessable_entity }
          format.js   { render layout: false, content_type: 'text/javascript' }
        end
      end
    end

    def get_unmasked_value(value)
      if value.present? && value.is_a?(String)
        unmasked_value = value.gsub(/[^0-9]/, '')
      else
        unmasked_value = nil
      end
    end  
    
    def update
        @loan = Loan.find(params[:id])
        if @loan.update(loan_params)
          flash[:notice] = "Loan was updated successfully"
          redirect_to loans_path
        else
          redirect_to loans_path, alert: @loan.errors.full_messages.join(', ')
          # render 'edit' # Uncomment this line if you want to render the edit view on failure
        end
    end
      
    def destroy 
        @loan = Loan.find(params[:id])
        @loan.destroy
        redirect_to loan_path, notice: 'Loan was successfully deleted.'
    end

    private
    
    def loan_params
      params.require(:loan).permit(:name, :lastName, :ssn, :email_address, :Address, :city, :state, :pincode, :martialstatus, :dependents, :dateOfBirth, :phonenumber, :purpose, :amount, :jobtitle, :income, :companyname, :companyaddress, :busiessNumber)
    end
    

end
