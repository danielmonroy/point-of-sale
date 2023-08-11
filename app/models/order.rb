class Order < ApplicationRecord
  belongs_to :store
  has_many :order_products
  has_one :payment

  enum order_type: [ :local, :togo, :delivery ]
  enum status: [ :open, :closed ]
  enum delivery_app: [ :ours, :rappi, :eats ]
  enum discount_type: [ :percentage, :direct ]

  scope :open, -> { where(status: :open) }

  def subtotal
    subtotal = 0
    order_products.each do |op|
      subtotal += op.product.price * op.quantity
    end
    subtotal
  end

  def total
    return subtotal unless discount
    
    if percentage? 
      return (subtotal - (subtotal * discount / 100.0)).ceil
    elsif direct?
      return subtotal - discount
    end
  end

  def close(payment_method)
    self.closed!
    Payment.create(order_id: self.id, total: total, payment_method: payment_method.to_i)
  end
end
