class User < ApplicationRecord
  enum sex: [:male, :female]
  before_validation {email.downcase!}
  validates :name, :email, :birthday, :sex, :school, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true
  validates :birthday, length: { is: 8 }
  has_secure_password
  validates :password, length: { minimum: 6 }
end
