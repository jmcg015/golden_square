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
    @menu
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
    item_prices = []
    @order.each do |item|
      puts "#{item.name}: £#{item.price}.00"
      @order_total += item.price
    end
    return "Your total is £#{@order_total}.00"
  end
end
