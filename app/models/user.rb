class User < ApplicationRecord
  has_many :interviews, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum sex: [:male, :female]
end
