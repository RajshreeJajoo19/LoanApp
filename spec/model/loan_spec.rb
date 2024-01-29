# spec/models/loan_spec.rb

require 'rails_helper'

RSpec.describe Loan, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(50) }
    it { should validate_presence_of(:purpose) }
    # Uncomment the following lines if you decide to include validations for amount and income
    it { should validate_presence_of(:amount) }
    it { should validate_length_of(:amount).is_at_least(2).is_at_most(20) }
    it { should validate_presence_of(:income) }
    it { should validate_length_of(:income).is_at_least(2).is_at_most(20) }
    it { should validate_presence_of(:ssn) }
    it { should validate_length_of(:ssn).is_at_least(6).is_at_most(20) }
    it { should validate_presence_of(:email_address) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
