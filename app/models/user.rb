class User < ApplicationRecord

  has_many :tasks
  has_many :labels
  enum user_type: { admin: 1, normal: 2 }
  scope :admin, -> { where(user_type: User.user_types[:admin]) }

end
