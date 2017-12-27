class Task < ApplicationRecord

  enum status: { not_complete: 1, complete: 2, pending: 3 }
end
