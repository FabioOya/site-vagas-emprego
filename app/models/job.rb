class Job < ApplicationRecord
  belongs_to :head_hunter
  has_many :apply_jobs
  has_many :profiles, through: :apply_jobs
  validates :title, :description, :skills,
             :salary, :job_level, :end_date, 
             :location, presence: true
  scope :search, ->(query) { where('title LIKE ?', "%#{query}%")
                            .or(where('description LIKE ?', "%#{query}%"))}

end
