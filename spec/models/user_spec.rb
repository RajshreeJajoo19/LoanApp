# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  context "associations" do
    it { should have_many(:loans).dependent(:destroy) }
  end

  context "enums" do
    it { should define_enum_for(:user_role).with_values(User.user_roles) }
  end

  context "devise modules" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  context "roles" do
    user = User.new(
      email: "test@mailinator.com",
      password: "Sigma@1234",
      user_role: :applicant,
    )
    
    it "should have a default role" do
      expect(user.has_role?(:applicant)).to be false
      expect(user).to be_valid
    end

    it "should be able to assign the admin role" do
      user.user_role = User.user_roles[:admin]
      expect(user.user_role).to eq "admin"
    end
  end

  describe 'Devise specific behavior' do
    it 'creates a recoverable user' do
      user = FactoryBot.create(:user, :recoverable)
      expect(user.reset_password_token).not_to be_nil
      expect(user.reset_password_sent_at).not_to be_nil
    end
  end

  describe 'traits' do
    context 'database_authenticatable' do
      it 'creates a database_authenticatable user' do
        user = FactoryBot.create(:user, :database_authenticatable)
        expect(user.encrypted_password).not_to be_nil
      end
    end

    context 'recoverable' do
      it 'creates a recoverable user' do
        user = FactoryBot.create(:user, :recoverable)
        expect(user.reset_password_token).not_to be_nil
        expect(user.reset_password_sent_at).not_to be_nil
      end
    end

    context 'rememberable' do
      it 'creates a rememberable user' do
        user = FactoryBot.create(:user, :rememberable)
        expect(user.remember_created_at).not_to be_nil
      end
    end

    context 'validatable' do
      it 'creates a validatable user' do
        user = FactoryBot.create(:user, :validatable)
        expect(user.valid?).to be_truthy
      end
    end
  end
end
