class Task < ApplicationRecord
  belongs_to :category
  has_one :user, through: :category
  validates :title, :description, :due_date, presence: true
end
