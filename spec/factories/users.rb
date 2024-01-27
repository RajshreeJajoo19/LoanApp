FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "user#{n}@example.com" }
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
      
    end
end
  