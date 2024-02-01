class ExternalIncomesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_external_income, only: %i[ show edit update destroy ]

  # GET /external_incomes or /external_incomes.json
  def index
    @external_incomes = ExternalIncome.all.order(date: :desc)
  end

  # GET /external_incomes/1 or /external_incomes/1.json
  def show
  end

  # GET /external_incomes/new
  def new
    @external_income = ExternalIncome.new
  end

  # GET /external_incomes/1/edit
  def edit
  end

  # POST /external_incomes or /external_incomes.json
  def create
    @external_income = ExternalIncome.new(external_income_params)

    respond_to do |format|
      if @external_income.save
        format.html { redirect_to external_incomes_path, notice: "External income was successfully created." }
        format.json { render :show, status: :created, location: @external_income }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @external_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /external_incomes/1 or /external_incomes/1.json
  def update
    respond_to do |format|
      if @external_income.update(external_income_params)
        format.html { redirect_to external_income_url(@external_income), notice: "External income was successfully updated." }
        format.json { render :show, status: :ok, location: @external_income }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @external_income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /external_incomes/1 or /external_incomes/1.json
  def destroy
    @external_income.destroy

    respond_to do |format|
      format.html { redirect_to external_incomes_url, notice: "External income was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_income
      @external_income = ExternalIncome.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def external_income_params
      params.require(:external_income).permit(:date, :amount, :source, :description, :payment_method)
    end
end
