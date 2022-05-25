class Takeaway
  def initialize
    @menu = []
  end

  def add_to_menu(food)
    @menu << food
  end

  def show_menu
    @menu
  end
end
