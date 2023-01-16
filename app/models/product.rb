class Product < ApplicationRecord

  validates :title, :description, :price, presence: true
  validates :title, uniqueness: true, length: {minimum: 10}
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url,
            format: {
              with: %r{\.(gif|jpg|png|jpeg)\z}i
            }
end
