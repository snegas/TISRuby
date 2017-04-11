class Product < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  has_many :product_attachments, dependent: :destroy
  accepts_nested_attributes_for :product_attachments, allow_destroy: true
  after_save ThinkingSphinx::RealTime.callback_for(:product)
  after_destroy ThinkingSphinx::RealTime.callback_for(:product)
end
