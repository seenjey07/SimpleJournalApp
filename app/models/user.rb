class User < ApplicationRecord
  has_many :categories, foreign_key: :username, primary_key: :username
  has_many :tasks, through: :categories
  has_secure_password

  validates :email, :username, presence: true
  validates_uniqueness_of :email, :username
  validates :password, presence: true, length: { in: 6..15 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{6,15}\z/, message: "must include at least one letter, one number, and one symbol" }

end
