class ApplyJob < ApplicationRecord
  belongs_to :job
  belongs_to :profile
  validates :reason, presence: true

  enum rejected: { not_rejected: 0, rejected: 1 } 

end
