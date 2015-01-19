module ApplicationHelper
  def current_employee
    if session[:user_id]
      Employee.find(session[:user_id])
    end
    # Employee.find_by signed_in: true
  end

  def calculate_profit(item)
    total = 0
    item.sale_items.each do |s|
      total += s.price
    end
    total
  end

  def calculate_total_sold(item)
    total = 0
    item.sale_items.each do |s|
      total += 1
    end
    total
  end
end
