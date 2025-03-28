class ReportsController < ApplicationController
  before_action :authenticate_user!
  
  def daily_report
    if params[:date].present?
      date = params[:date].to_time + 6.hours
    else
      date = Time.now.in_time_zone("Mexico City").beginning_of_day
    end

    @cash_sales = Payment.cash.for_date(date, date + 24.hours).sum(:total)
    @card_sales = Payment.card.for_date(date, date + 24.hours).sum(:total)
    @transfer_sales = Payment.transfer.for_date(date, date + 24.hours).sum(:total)
    @total_sales = Payment.for_date(date, date + 24.hours).sum(:total)

    @close = Close.find_by(date: date.to_date)
    @date = date

    @top_sales_products = high_selling_products(date_start: date, date_end: date + 24.hours)
  end

  def monthly_report
    current_date = Date.today.day == 1 ? Date.today - 1.day : Date.today # Preventing error when zero data for a month
    @date = params[:date].present? ? Date.parse(params[:date]) : current_date

    @closes = Close.for_date(@date.beginning_of_month, @date.end_of_month).order(date: :asc)
    @expenses = Expense.for_date(@date.beginning_of_month, @date.end_of_month)
    @payments = Payment.for_date(@date.beginning_of_month, @date.end_of_month).count
    @external_incomes = ExternalIncome.for_date(@date.beginning_of_month, @date.end_of_month)

    @top_sales_products = high_selling_products(date_start: @date.beginning_of_month, date_end: @date.end_of_month + 24.hours, limit: 50)
  end

  def daily_close
    @close = Close.new(close_params)
    date = @close.date.to_time + 6.hours
    
    total_reported = Payment.for_date(date, date + 24.hours).sum(:total)
    total_real = @close.cash_total + @close.card_total + @close.transfer_total

    @close.real_total = total_real
    @close.reported_difference = total_real + @close.cash_expenses - total_reported

    if @close.save
      redirect_to daily_report_reports_path(date: date.strftime("%Y-%m-%d")), notice: "Cierre exitoso."
    else
      redirect_to daily_report_reports_path(date: date.strftime("%Y-%m-%d")), alert: "Algo salió mal."
    end
  end

  def closes
    @closes = Close.order(date: :desc).limit(30)
  end

  private

  def high_selling_products(date_start:, date_end:, limit: 10000)
    date_start = date_start.to_time + 6.hours
    date_end = date_end.to_time + 30.hours

    product_ids = OrderProduct.where(created_at: date_start..date_end).
      group(:product_id).
      order('sum_quantity DESC').
      sum(:quantity)

    result = {}

    product_ids.each do |key, val|
      result[Product.find(key)] = val
    end

    result
  end

  def close_params
    params.require(:close).permit(:cash_total, :card_total, :transfer_total, :cash_expenses, :comments, :date)
  end
end
