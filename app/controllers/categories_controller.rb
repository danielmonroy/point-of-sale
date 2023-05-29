class CategoriesController < ApplicationController
  before_action :authenticate_user!

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.store_id = current_user.store_id

    respond_to do |format|
      if @category.save
        format.html { redirect_to products_path, notice: "Nueva categoría creada con éxito." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :store_id)
    end
end
