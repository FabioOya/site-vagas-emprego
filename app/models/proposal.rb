class Proposal < ApplicationRecord
  belongs_to :head_hunter
  belongs_to :job
  belongs_to :profile
end
