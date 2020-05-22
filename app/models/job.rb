class Job < ApplicationRecord
  belongs_to :head_hunter
  scope :search, ->(query) { where('title LIKE ?', "%#{query}%")
                            .or(where('description LIKE ?', "%#{query}%"))}

end
