class Task < ApplicationRecord
  validates :title, :description, :due_date, presence: true
  belongs_to :category
end
