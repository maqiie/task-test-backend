class Note < ApplicationRecord
  belongs_to :user
  belongs_to :reminder, optional: true  # Assuming a note can belong to a reminder, but it's optional
end
