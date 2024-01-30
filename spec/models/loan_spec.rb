# spec/models/loan_spec.rb

require 'rails_helper'

RSpec.describe Loan, type: :model do
  let(:user) { create(:user) }
  it "is valid with valid attributes" do
    loan = Loan.new(
      name: "John",
      lastName: "Doe",
      email_address: "john.doe@example.com",
      phonenumber: "1234567890",
      dateOfBirth: Date.new(1990, 1, 1),
      ssn: "123456",
      Address: "123 Main St",
      city: "City",
      state: "ST",
      pincode: "342001",
      maritalstatus: "Single",
      jobtitle: "Engineer",
      companyname: "ABC Inc",
      companyaddress: "456 Business St",
      income: 50000,
      purpose: "Home",
      amount: 10000,
      user: user
    )
    expect(loan).to be_valid
  end
end
