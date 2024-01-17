class LoanApplication < ApplicationRecord
    validates :name, presence: true, length: { minimum: 6, maximum: 20 }
    validates :purpose, presence: true
    # validates :amount, presence: true, length: { minimum: 6, maximum: 20 }
    validates :ssn, presence: true, length: { minimum: 6, maximum: 20 }
    validates :email_address, presence: true, uniqueness: true
end