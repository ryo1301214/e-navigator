class Interview < ApplicationRecord
  belongs_to :user
  validates :day, :user_id, presence: true
end
