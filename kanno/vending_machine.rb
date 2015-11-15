class VendingMachine
  ALLOW_COINS_AND_BILLS = [10, 50, 100, 500, 1000].freeze
  attr_reader :feeding_money, :sales

  def initialize
    @feeding_money = 0
    @menu = Drink.new('コーラ', 120, 5)
    @sales = 0
  end

  def feed(money)
    return @feeding_money += money if ALLOW_COINS_AND_BILLS.include? money
    money
  end

  def refund
    refund_money = @feeding_money
    @feeding_money = 0
    refund_money
  end

  def show_menu
    @menu.to_h
  end

  def getatable_cola?
    @menu.stock > 0 && @feeding_money >= @menu.price
  end

  def buy_cola
    return unless getatable_cola?

    @menu.decrease_stock
    @feeding_money -= @menu.price
    @sales += @menu.price
  end
end

class Drink
  attr_reader :stock, :price

  def initialize(name, price, stock)
    @name = name
    @price = price
    @stock = stock
  end

  def to_h
    { name: @name, price: @price, stock: @stock }
  end

  def decrease_stock
    @stock -= 1 if @stock > 0
  end
end
