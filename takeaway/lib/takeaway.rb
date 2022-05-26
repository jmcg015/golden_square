require "twilio-ruby"

class Takeaway
  def initialize(terminal)
    @terminal = terminal
    @menu = []
    @order = []
    @order_total = 0
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
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

  def place_order
    hour = Time.now.strftime("%H").to_i
    min = Time.now.strftime("%M").to_i
    message = @client.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: ENV["MY_NUMBER"],
      body: "Thank you! Your order was placed and will be delivered before #{hour + 1}:#{min}",
    )
  end
end
