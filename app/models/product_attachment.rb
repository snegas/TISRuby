class ProductAttachment < ActiveRecord::Base
  belongs_to :product
  has_attached_file :photo,
                    styles: { original: ['600x400>', :png] }, convert_options: { original: '-quality 90' }
  validates_attachment :photo, presence: true,
                       content_type: { content_type: ['image/jpeg', 'image/png', 'image/gif'] },
                       size: { in: 0..2048.kilobytes }
end