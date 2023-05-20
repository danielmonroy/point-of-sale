class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @categories = Category.where(store_id: current_user.store_id)
    @working_stations = WorkingStation.where(store_id: current_user.store_id)
    @items = Item.where(store_id: current_user.store_id)
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.store_id = current_user.store_id
    @product.available = false

    respond_to do |format|
      if @product.save
        format.html { redirect_to edit_product_url(@product), notice: "Producto creado con éxito." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_product_items
    @product_item = ProductItem.create(product_item_params)
    respond_to do |format|
      if @product_item.save
        format.html { redirect_to edit_product_url(@product_item.product), notice: "Ingrediente agregado con éxito." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to edit_product_url(@product), notice: "Producto editado con éxito." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def destroy_product_item
    @product_item = ProductItem.find_by(id: params[:product_item_id])
    product = @product_item.product
    @product_item.destroy

    respond_to do |format|
      format.html { redirect_to edit_product_url(product), notice: "Ingrediente eliminado con éxito." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :category_id, :store_id, :available, :product_code, :working_station_id, :price)
    end

    def product_item_params
      params.require(:product_item).permit(:item_id, :product_id, :quantity)
    end
end
