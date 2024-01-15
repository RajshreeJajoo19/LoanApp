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
        @loans = Loan.all
    end


    def new
        @loan = Loan.new
    end


    def edit
        @loan = Loan.find(params[:id])
    end


    # Create action to save data in the Loan model
    def create
        @loan = Loan.new(loan_params)
        if @loan.save
            flash[:notice] = "Loan application was created successfully"
            redirect_to loans_path
        else
           redirect_to new_loan_path, alert: @loan.errors.full_messages.join(', ')
            #render 'new'
        end
    end

    def update
        @loan = Loan.find(params[:id])
      
        if @loan.update(loan_params)
          flash[:notice] = "Loan was updated successfully"
          redirect_to loans_path
        else
          redirect_to new_loan_path, alert: @loan.errors.full_messages.join(', ')
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
        params.require(:loan).permit(:name, :purpose, :amount, :ssn, :email_address, :income, :status)
      end


end
