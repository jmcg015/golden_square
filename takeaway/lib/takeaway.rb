require_relative "food"

class Takeaway
  def initialize(terminal)
    @terminal = terminal
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
      @terminal.puts "#{item.name.capitalize}: £#{item.price}.00"
    end
  end

  def show_order
    @order
  end

  def order_total
    return "Your total is £#{@order_total}.00"
  end

  def order(food)
    @order << food
  end

  def receipt
    item_list = " "
    @order.each do |item|
      @terminal.puts "#{item.name.capitalize}: £#{item.price}.00"
      @order_total += item.price
    end
  end
end
