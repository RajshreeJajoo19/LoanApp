FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "user_#{n}@example.com" }
      password { 'password123' }
      user_role { 1 }
  
      trait :admin do
        user_role { 2 }
      end
  
      trait :with_reset_password_token do
        reset_password_token { 'some_token' }
      end

      trait :with_loans do
        after(:create) do |user|
          create_list(:loan, 3, user: user)
        end
      end
      
      trait :database_authenticatable do
        encrypted_password { Devise::Encryptor.digest(User, 'password123') }
      end
  
      trait :registerable do
        confirmed_at { Time.current }
      end
  
      trait :recoverable do
        reset_password_token { Devise.token_generator.generate(User, :reset_password_token) }
        reset_password_sent_at { Time.current }
      end
  
      trait :rememberable do
        remember_created_at { Time.current }
      end
  
      trait :validatable do
        email { Faker::Internet.email }
        password { 'password123' }
      end
    end
end


  