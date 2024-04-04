class Comment < ApplicationRecord
  belongs_to :bug_report
  belongs_to :user
  validates :content, presence: true
end
