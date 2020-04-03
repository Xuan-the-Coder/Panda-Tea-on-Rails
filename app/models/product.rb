class Product < ApplicationRecord
  belongs_to :category
  has_many :orders
  has_many :users, through: :orders
  validates :name, presence: true

  paginates_per 10
end
