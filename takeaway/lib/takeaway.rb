require "twilio-ruby"

ACCOUNT_SID = ENV["TWILIO_ACCOUNT_SID"]
AUTH_TOKEN = ENV["TWILIO_AUTH_TOKEN"]

class Takeaway
  def initialize(terminal)
    @terminal = terminal
    @menu = []
    @order = []
    @order_total = 0
    @client = ""
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
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
    @client.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: ENV["MY_NUMBER"],
      body: "Thank you! Your order was placed and will be delivered before 18:52",
    )
  end
end

takeaway = Takeaway.new(Kernel)
takeaway.place_order
