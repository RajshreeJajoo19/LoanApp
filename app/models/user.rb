class User < ApplicationRecord
  rolify

  enum user_role: { admin: 2, applicant: 1 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :loans
  
end