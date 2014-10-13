class Job < ActiveRecord::Base
  validates :title, :description, :location, presence: true
end

