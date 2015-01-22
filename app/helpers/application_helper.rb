module ApplicationHelper
  def current_employee
    if session[:user_id]
      Employee.find(session[:user_id])
    end
  end

  def current_restaurant
    if session[:restaurant_id]
      Restaurant.find(session[:restaurant_id])
    end
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

  def get_sold_by_date(item)
    week = 1.week.ago.to_date..Date.today
    sold = []
    week.each do |date|
      sold << item.sale_items.where("extract(year from created_at) = ? and extract(month from created_at) = ? and extract(day from created_at) = ?", date.year, date.month, date.day).count
    end

    return sold
  end

  def current_sale
    if current_employee
      if !current_employee.current_sale
        sale = Sale.create(employee: current_employee)
        current_employee.update(current_sale: sale.id )
        sale
      else
        Sale.find(current_employee.current_sale)
      end
    end
  end
end
