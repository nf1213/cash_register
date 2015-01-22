class SalesController < ApplicationController
  before_action :restaurant_exists?
  before_action :authenticate
  before_action :must_be_manager, only: [:index]

  def update
    @sale = Sale.find(params[:id])
    current_employee.update(current_sale: nil)
    print_receipt(@sale)
    redirect_to root_path
  end

  def print_receipt(sale)
    dir = "public/receipts/receipt.txt"
    File.open(dir, "w") do |f|
      f.puts Restaurant.first.name
      f.puts "-------------------------"
      sale.sale_items.each do |si|
        price = si.price / 100.00
        f.puts "#{si.name}\t#{sprintf('$%.2f', price)}"
      end
      f.puts "-------------------------"
      total = sale.total / 100.00
      f.puts "Total: #{sprintf('$%.2f', total)}"
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    current_employee.update(current_sale: nil)
    @sale.destroy
    redirect_to root_path, alert: "Transaction cancelled"
  end

  def index
    @sales = current_restaurant.sales
    @items = current_restaurant.items
  end

  def destroy_all
    current_restaurant.sales.each do |s|
      e = Employee.find(s.employee_id)
      if e.current_sale != s.id
        s.destroy
      end
    end
    redirect_to sales_path, alert: "Sales Destroyed"
  end
end
