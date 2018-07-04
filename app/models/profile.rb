class Profile < ApplicationRecord
  belongs_to :user
  enum sex: [:male, :female]
  validates :name, :birthday, :sex, :school, presence: true
  validates :birthday, length: { is: 8 }
  validates :user_id, uniqueness: true
end
