class Category < ApplicationRecord
  belongs_to :user, foreign_key: :username, primary_key: :username
  has_many :tasks, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
