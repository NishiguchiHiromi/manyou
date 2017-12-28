class Task < ApplicationRecord

  belongs_to :user
  enum status: { non_progress: 1, in_progress: 2, complete: 3, pending: 4 }
  validates :title, presence: true
  validates :text, presence: true

  scope :search, ->(word) { where('tasks.title like ?', '%' + word.gsub(/[\\%_]/) { |m| "\\#{m}" } + '%') }

end
