# 1. User Stories
As a customer, so that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer, so that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer, so that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

# 2. Design the Class System
class Takeaway
  def initialze
    order = [] #stores food that's been ordered
    order_price = 0
    @menu = [
      {chips: 2},
      {burger: 5},
      {pizza: 8},
      {soft-drink: 1},
      {water: 0}
    ]
  end

  def show_menu
    # Formats @menu to output like "Chips: £2.00, Burger: £5.00...
  end

  def order(food) #food is of type Food
    #adds food to @order
  end

  def receipt
    # Returns an intemised receipt with the total order_price
    # Iterate over order array, get price of food, print it. 
    # increases order total by price of food item
  end


class Food
  def init(name, price)
    @name = name
    @price = price
  end

  def name
    @name
  end

  def price
    @price
  end
end

# 3. Create Examples as Integration Tests

Food can be added to the order

Receipt shows prices of all items in order and totals them all up

# 4. Create Examples as Unit Tests
  ## Takeaway
Initially order is an empty list
          Order price is 0

Shows the menu

Mocks - adding food tot he order
      - Printing the itemised receipt

  ## Food

returns the name of the food item

returns the price of the food

# 5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.