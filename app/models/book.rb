class Book < ApplicationRecord
  belongs_to :category
  has_many :orders
  has_many :users, through: :orders 
end
