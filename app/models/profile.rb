class Profile < ApplicationRecord
  belongs_to :candidate
  has_one_attached :photo
  has_many :commentaries
  has_many :apply_jobs
  has_many :jobs, through: :apply_jobs
  has_many :proposals
  validates :full_name, :birthdate, :formation, 
            :description, :experience, presence: true

  enum featured: { not_featured: 0, featured: 1}
end
