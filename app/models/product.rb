class Product < ApplicationRecord
  belongs_to :category
  belongs_to :store
  belongs_to :working_station
  has_many :product_items
  has_one_attached :image
end
