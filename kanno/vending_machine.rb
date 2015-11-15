class VendingMachine
  ALLOW_COINS_AND_BILLS = [10, 50, 100, 500, 1000].freeze
  attr_reader :feeding_money

  def initialize
    @feeding_money = 0
    @menu = Drink.new('コーラ', 120, 5)
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
end

class Drink
  def initialize(name, price, stock)
    @name = name
    @price = price
    @stock = stock
  end

  def to_h
    { name: @name, price: @price, stock: @stock }
  end
end
