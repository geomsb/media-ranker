class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work
  validates :date, presence: true

  def self.spotlight
    winner = Vote.all.group(:work_id).count.max_by do |work_id, votes| votes end
    winner_id = winner[0]
    return Work.find_by(id: winner_id)
  end
end
