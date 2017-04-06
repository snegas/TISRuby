class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end
