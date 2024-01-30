class Loan < ApplicationRecord

    validates :name, presence: true, length: { minimum: 3, maximum: 50 }
    validates :lastName, presence: true, length: { minimum: 3, maximum: 50 }
    validates :email_address, presence: true,format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phonenumber, presence: true
    validates :dateOfBirth, presence: true
    validates :ssn, presence: true, length: { minimum: 6}

    validates :Address, presence: true, length: { minimum: 2 }
    validates :city, presence: true, length: { minimum: 2 }
    validates :state, presence: true, length: { minimum: 2 }
    validates :pincode, presence: true, length: { minimum: 6 }
    validates :maritalstatus, presence: true 
    # validates :Dependents, presence: true

    validates :jobtitle, presence: true, length: { minimum: 2 }
    validates :companyname, presence: true, length: { minimum: 2 }
    validates :companyaddress, presence: true, length: { minimum: 2 }
    validates :income, presence: true, length: { minimum: 4 }

    validates :purpose, presence: true
    validates :amount, presence: true,length: { minimum: 4 }


    belongs_to :user
end
