module SessionHelper
  def current_sale
    if current_employee
      if !current_employee.current_sale
        sale = Sale.create(employee: current_employee, restaurant: current_restaurant)
        current_employee.update(current_sale: sale.id )
        sale
      else
        Sale.find(current_employee.current_sale)
      end
    end
  end

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
end
