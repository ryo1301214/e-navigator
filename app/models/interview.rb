class Interview < ApplicationRecord
  belongs_to :user
  validates :day, :user_id, presence: true
  enum permission: { waiting: 0, admitted: 1, denied: 2 }
end
