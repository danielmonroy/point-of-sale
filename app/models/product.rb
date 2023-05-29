class Product < ApplicationRecord
  belongs_to :category
  belongs_to :store
  belongs_to :working_station
  has_many :product_items
  has_one_attached :image

  scope :for_store, -> (store_id) { where(store_id: store_id) }
  scope :available, -> { where(available: true) }
end
