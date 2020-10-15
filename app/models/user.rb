class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :products, through: :orders
  belongs_to :province
  accepts_nested_attributes_for :orders, allow_destroy: true

  validates :first_name, :last_name, presence: true
end
