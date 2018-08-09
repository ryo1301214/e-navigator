class Interview < ApplicationRecord
  belongs_to :user
  validates :day, :user_id, presence: true
  validate :day_check
  enum permission: { waiting: 0, admitted: 1, denied: 2 }

  def day_check
    errors.add(:day, "should be later than present") if self.day < Time.current
  end
end
