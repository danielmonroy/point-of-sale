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
  end
end
