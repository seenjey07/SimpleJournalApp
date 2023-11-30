class Task < ApplicationRecord
  belongs_to :category
  validates :title, :description, presence: true
  validates :due_date, presence: true
end
