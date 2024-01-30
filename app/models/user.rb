class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  rolify
  enum user_role: { admin: 2, applicant: 1 }
  has_many :loans, dependent: :destroy
end
