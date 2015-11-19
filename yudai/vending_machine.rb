class VendingMachine
  MONEY_TYPES = [10, 50, 100, 500, 100, 1000]

  def initialize
    @drink_stock = [Drink.set_cola, Drink.set_redbull, Drink.set_water]
    @charged_amount = 0
    @sales = 0
  end

  def charge_money(money)
    MONEY_TYPES.include?(money) ? @charged_amount += money : money
  end

  def refund
    refund_amount = @charged_amount
    @charged_amount = 0
    return refund_amount
  end

  def perchase(drink_name)
    return false unless perchasable?(drink_name)
    calculate(drink_name)
    return display_purchace_result(drink_name)
  end

  def show_perchasable_drink_stock
    perchasable_drink_stock.map {|drink| drink.to_s}
  end

  def perchasable?(drink_name)
    return false unless find_drink(drink_name)
    enough_drink_count?(drink_name) && enough_money?(drink_name)
  end

  def show_charged_amount
    @charged_amount
  end

  private

    def calculate(drink_name)
      find_drink(drink_name).decrement
      @charged_amount -= find_drink(drink_name).price
      @sales += find_drink(drink_name).price
    end

    def display_purchace_result(drink_name)
      "#{drink_name}やるよ"
    end

    def enough_drink_count?(drink_name)
      find_drink(drink_name).count > 0
    end

    def enough_money?(drink_name)
      @charged_amount >= find_drink(drink_name).price
    end

    def find_drink(drink_name)
      @drink_stock.find { |drink| drink.name == drink_name }
    end

    def perchasable_drink_stock
      @drink_stock.select { |drink| perchasable?(drink.name) }
    end

end

class Drink
  attr_reader :name, :price, :count

  def initialize(name, price, count)
    @name = name
    @price = price
    @count = count
  end

  def decrement
    @count -= 1
  end

  def to_s
    "Name : #{name} | price : #{price} | count : #{count}"
  end

  class << self
    def set_cola
      self.new('コーラ', 120, 5)
    end

    def set_redbull
      self.new('レッドブル', 120, 5)
    end

    def set_water
      self.new('水', 120, 5)
    end
  end
end
