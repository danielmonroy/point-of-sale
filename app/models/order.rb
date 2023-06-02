class Order < ApplicationRecord
  belongs_to :store
  has_many :order_products
  has_one :payment

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

  def close(payment_method)
    self.closed!
    Payment.create(order_id: self.id, total: subtotal, payment_method: payment_method.to_i)
  end
end
