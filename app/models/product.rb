class Product < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  has_attached_file :photo,
      styles: { original: ['600x400>', :png] }, convert_options: { original: '-quality 90' }
  validates_attachment :photo, presence: true,
                       content_type: { content_type: ['image/jpeg', 'image/png', 'image/gif'] },
                       size: { in: 0..2048.kilobytes }

  after_save ThinkingSphinx::RealTime.callback_for(:product)
end
