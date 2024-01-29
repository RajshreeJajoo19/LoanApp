# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do

    describe "validations" do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password) }
      it { should validate_uniqueness_of(:email).case_insensitive }
    end
  
    describe "associations" do
      it { should have_many(:loans) }
    end

    describe "roles" do
      it { should respond_to(:admin?) }
      it { should respond_to(:applicant?) }
    end

    describe "enums" do
      it { should define_enum_for(:user_role).with_values(admin: 2, applicant: 1) }
    end

    describe "devise modules" do
      it { should have_db_column(:email).of_type(:string) }
      it { should have_db_column(:encrypted_password).of_type(:string) }
      it { should have_many(:loans) }
    end
end
