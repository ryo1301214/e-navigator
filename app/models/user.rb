class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :birthday, :sex, :school, presence: true
  validates :birthday, length: { is: 8 }
  enum sex: [:male, :female]
end
