class Item < ApplicationRecord
  belongs_to :store
  belongs_to :provider
end
