class Profile < ApplicationRecord
  enum sex: [:male, :female]
  validates :name, :birthday, :sex, :school, presence: true
  validates :birthday, length: { is: 8 }
end
