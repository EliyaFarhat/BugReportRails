class BugReport < ApplicationRecord
  validates :title, presence: true
  validates :summary, presence: true
  belongs_to :user
end
