class Task < ApplicationRecord

  belongs_to :user
  has_many :labels

  enum status: { non_progress: 1, in_progress: 2, complete: 3, pending: 4 }
  validates :title, presence: true
  validates :text, presence: true

  scope :search, ->(word) { where('tasks.title like ?', '%' + word.gsub(/[\\%_]/) { |m| "\\#{m}" } + '%') }

  scope :search, lambda { |freeword|
    where(
      'tasks.title like :freeword or tasks.text like :freeword',
      freeword: '%' + freeword.gsub(/[\\%_]/) { |m| "\\#{m}" } + '%'
    )
  }

end
