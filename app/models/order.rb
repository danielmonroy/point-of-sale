class Order < ApplicationRecord
  belongs_to :store
  has_many :order_products

  enum order_type: [ :local, :togo, :delivery ]
  enum status: [ :open, :closed ]
  enum delivery_app: [ :ours, :rappi, :eats ]

  scope :open, -> { where(status: :open) }

  def subtotal
    subtotal = 0
    order_products.each do |op|
      subtotal += op.product.price * op.quantity
    end
    subtotal
  end
end
