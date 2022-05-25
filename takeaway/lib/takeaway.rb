class Takeaway
  def initialize
    @menu = []
    @order = []
    @order_total = 0
  end

  def add_to_menu(food)
    @menu << food
  end

  def show_menu
    formatted_menu = ""
    @menu.select do |item|
      formatted_menu += item.name + ": £#{item.price}.00"
    end
    return formatted_menu
  end

  def show_order
    @order
  end

  def order_total
    @order_total
  end

  def order(food)
    @order << food
  end

  def receipt
    item_list = ""
    @order.each do |item|
      item_list += item.name + " - £#{item.price}.00"
      item_list += " "
      @order_total += item.price
    end
    return "Your items are: #{item_list.strip}. Your total is £#{@order_total}.00"
  end
end
