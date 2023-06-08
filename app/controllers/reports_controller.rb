class ReportsController < ApplicationController
  before_action :authenticate_user!
  
  def daily_report
    if params[:date].present?
      date = params[:date].to_date
    else
      date = Time.now.to_date
    end

    @cash_sales = Payment.cash.for_date(date.beginning_of_day.in_time_zone("Mexico City"), date.end_of_day.in_time_zone("Mexico City")).sum(:total)
    @card_sales = Payment.card.for_date(date.beginning_of_day.in_time_zone("Mexico City"), date.end_of_day.in_time_zone("Mexico City")).sum(:total)
    @transfer_sales = Payment.transfer.for_date(date.beginning_of_day.in_time_zone("Mexico City"), date.end_of_day.in_time_zone("Mexico City")).sum(:total)
    @total_sales = Payment.for_date(date.beginning_of_day.in_time_zone("Mexico City"), date.end_of_day.in_time_zone("Mexico City")).sum(:total)
  end
end