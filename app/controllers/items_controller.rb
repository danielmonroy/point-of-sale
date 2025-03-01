class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
    @providers = Provider.where(store_id: current_user.store_id)
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @providers = Provider.where(store_id: current_user.store_id)
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    @item.store_id = current_user.store_id


    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: "Insumo creado con éxito." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path, notice: "Insumo editado con éxito." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :stock, :measurement_unit, :stock_warning, :store_id, :provider_id)
    end
end
