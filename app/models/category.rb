class Category < ApplicationRecord
  belongs_to :store
  has_many :products
  has_one_attached :image

  scope :for_store, -> (store_id) { where(store_id: store_id) }
end
