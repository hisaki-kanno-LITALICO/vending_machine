class VendingMachine
  def initialize
    @money = 0
    @available_money = [10, 50, 100, 500, 1000]
    @drinks = []
  end

  def insert(money)
    if @available_money.include?(money)
      @money += money
    else
    end
  end

  def create(drink, quantity)
    @drinks << {drink: drink, quantity: quantity}
  end

  def return
    @money = 0
  end

  def buy()
  end

  def list
    @drinks
  end

  private

  def self.create_cola
    cola = Drink.new("コーラ",120)
    self.create(cola,5)
  end
end

class Drink
  def initialize(name, price)
    @name = name
    @price = price
  end
end
