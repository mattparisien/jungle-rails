class Admin::DashboardController < ApplicationController
  def show
    @products_total = Product.count
    @categories_total = Product.group(:category_id).count
  end
end
