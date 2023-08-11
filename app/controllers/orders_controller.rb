class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[ show edit update destroy add_ordered_product close print remove_ordered_product add_discount remove_discount ]
  before_action :set_product, only: %i[ add_ordered_product ]
  before_action :set_ordered_product, only: %i[ view_ordered_product remove_ordered_product ]

  layout "orders/application"

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  def active_orders
    @orders = Order.open.order(created_at: :desc)
  end

  def closed_orders
    @orders = Order.closed.order(created_at: :desc).limit(25)
  end

  def view_ordered_product
    @product = @order_product.product
  end

  def remove_ordered_product
    @order_product.destroy

    respond_to do |format|
      format.html { redirect_to @order, notice: "Producto removido." }
    end
  end

  def add_ordered_product
  end

  def add_product
    return unless params[:order_id].present? && params[:product_id].present?
    
    @order_product = OrderProduct.new(ordered_product_params)
    respond_to do |format|
      if @order_product.save
        format.html { redirect_to @order, notice: "Producto agregado." }
      else
        format.html { redirect_to @order, notice: "No se pudo agregar el producto." }
      end
    end
  end

  def close
    if @order.open?
      respond_to do |format|
        if @order.close(params[:payment_method])
          format.html { redirect_to active_orders_orders_path }
        else
          format.html { redirect_to @order, notice: "No se pudo cerrar la orden." }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to closed_orders_orders_path , alert: 'Orden cerrada previamente' }
      end
    end
  end

  def open_ordered_product

  end

  def add_discount
    return unless discount_params[:discount].present? && discount_params[:discount_type].present?

    @order.discount = discount_params[:discount]
    @order.discount_type = discount_params[:discount_type]
    
    if @order.save
      respond_to do |format|
        format.html { redirect_to edit_order_path(@order), notice: "Descuento agregado." }
      end
    end
  end

  def remove_discount
    @order.discount = nil
    @order.discount_type = nil

    if @order.save
      respond_to do |format|
        format.html { redirect_to edit_order_path(@order), notice: "Se eliminó el descuento." }
      end
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @products = Product.for_store(current_user.store_id).available
    @categories = Category.for_store(current_user.store_id).order(name: :asc)
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    @order.store_id = current_user.store_id

    respond_to do |format|
      if @order.save
        format.html { redirect_to edit_order_url(@order) }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def print
    render layout: "thermal_print"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_ordered_product
      @order_product = OrderProduct.find(params[:order_product_id])
    end

    def ordered_product_params
      params.permit(:product_id, :order_id, :comment, :quantity)
    end

    def discount_params
      params.permit(:discount, :discount_type)
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:order_type, :status, :delivery_app, :table, :store_id)
    end
end
