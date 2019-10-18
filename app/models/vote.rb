class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work
  validates :date, :user_id, :work_id, presence: true
end
