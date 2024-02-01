# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
available_permissions = [
  "access_daily_report",
  "access_monthly_report",
  "access_closes_report",
  "access_products",
  "access_items",
  "access_providers",
  "access_product_categories",
  "create_closing_report",
  "access_admin_panel",
  "access_expenses",
  "create_expenses",
  "access_external_incomes",
  "create_external_incomes"
]

available_permissions.each { |p| Permission.find_or_create_by(ability: p) }