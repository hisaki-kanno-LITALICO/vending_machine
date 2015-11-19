class VendingMachine
  ALLOW_COINS_AND_BILLS = [10, 50, 100, 500, 1000].freeze
  attr_reader :feeding_money, :sales

  def initialize
    @feeding_money = 0
    @sales = 0
    @menus = {
      cola: Drink.new('コーラ', 120, 5),
      redbull: Drink.new('レッドブル', 200, 5),
      water: Drink.new('水', 120, 5)
    }
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

  def menus
    @menus.collect do |menu|
      menu[1].to_s
    end
  end

  def getatable_menus
    @menus.select do |k, v|
      v.getatable?(@feeding_money)
    end.collect do |menu|
      menu[1].to_s
    end
  end

  def cola_getatable?
    @menus[:cola].getatable?(@feeding_money)
  end

  def buy_cola
    return unless cola_getatable?

    @menus[:cola].decrease_stock
    @feeding_money -= @menus[:cola].price
    @sales += @menus[:cola].price
  end
end

class Drink
  attr_reader :stock, :price

  def initialize(name, price, stock)
    @name = name
    @price = price
    @stock = stock
  end

  def to_s
    "商品名:#{@name} 値段:#{@price} 在庫数:#{@stock}"
  end

  def decrease_stock
    @stock -= 1 if @stock > 0
  end

  def getatable?(feeding_money)
    @stock > 0 && feeding_money >= @price
  end
end
