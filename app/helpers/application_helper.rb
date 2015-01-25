module ApplicationHelper
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
end
