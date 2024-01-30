require 'faker'

FactoryBot.define do
    factory :loan do
        name { Faker::Name.name }
        lastName { Faker::Name.last_name }
        ssn { Faker::IDNumber.valid }
        email_address { Faker::Internet.email }
        Address { Faker::Address.street_address }
        city { Faker::Address.city }
        state { Faker::Address.state }
        pincode { Faker::Number.number(digits: 6).to_s }
        maritalstatus { 'Single' } # Assuming a default value, adjust as needed
        dependents { Faker::Number.between(from: 0, to: 5) }
        dateOfBirth { Faker::Date.birthday(min_age: 18, max_age: 65) }
        phonenumber { Faker::PhoneNumber.phone_number }
        purpose { Faker::Lorem.sentence }
        amount { Faker::Number.between(from: 1000, to: 50000) }
        jobtitle { Faker::Job.title }
        income { Faker::Number.between(from: 10000, to: 100000) }
        companyname { Faker::Company.name }
        companyaddress { Faker::Address.street_address }
        busiessNumber { Faker::Company.duns_number }


        trait :admin do
            role { 'admin' }
        end
      
          trait :applicant do
            role { 'applicant' }
        end

    end
end
  