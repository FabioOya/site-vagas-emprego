class ApplyJob < ApplicationRecord
  belongs_to :job
  belongs_to :profile
 # validates :reason, presence: true

  enum status: {open:0, closed: 10}
end
