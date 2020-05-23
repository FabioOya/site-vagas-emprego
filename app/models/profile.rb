class Profile < ApplicationRecord
  belongs_to :candidate
  has_one_attached :photo
  has_many :apply_jobs
  has_many :jobs, through: :apply_jobs
  validates :full_name, :birthdate, :formation, 
            :description, :experience, presence: true
end
