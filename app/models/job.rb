class Job < ActiveRecord::Base
  validates :title, :description, :location, presence: true
  acts_as_taggable
end

