class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[ show edit update destroy ]

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.store_id = current_user.store_id

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: "Nueva categoría creada con éxito." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @categories = Category.where(store_id: current_user.store_id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :store_id, :image)
  end
end
