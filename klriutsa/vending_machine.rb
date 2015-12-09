class VendingMachine
  def initialize
    @money = 0
    @available_money = [10, 50, 100, 500, 1000]
    @drinks = StockDrink.new
  end

  def insert(money)
    if @available_money.include?(money)
      @money += money
    else
    end
  end

  def return
    @money = 0
  end

  def buy(name)
    @drinks.buy(name)
  end

  def random_buy
    random_drinks = []
    @drinks.each do |drink|
      if drink.price <= @money
        random_drinks << drink
      end
    end
    randon_drink = random_drinks.sample
    unless randon_drink.nil?
      buy(randon_drink)
    end
  end

  def stocks
    @drinks.list
  end

  def list
    number = 0
    @drinks.each do |drink|
      if drink.price <= @money
        p "#{number}:#{drink.name}"
        number += 1
      end
    end
  end

  private
end

class StockDrink
  attr_reader :quantity

  def initialize
    @stock_drinks = Hash.new { |h,k| h[k] = {} }
    create_drinks
  end

  def insert(drink, price)
    @stock_drinks[drink.name][:price] = price
    if @stock_drinks[drink.name][:drink].nil?
      @stock_drinks[drink.name][:drink] = { 0 => drink }
    else
      count = @stock_drinks[drink.name][:drink].count
      @stock_drinks[drink.name][:drink].store(count, drink)
    end
  end

  def buy(name)
    if @stock_drinks[name].nil?
      return false
    else
      @stock_drinks.
    end
  end

  # TODO 賞味期限
  def list
    @stock_drinks.each do |name,drink|
      p "#{name} 値段#{drink[:price]} 在庫#{drink[:drink].count}"
    end
    return true
  end

  private

  def create_drinks
    5.times do
      cola = Drink.new("コーラ", Time.now-3000000+rand(10000000))
      insert(cola, 120)
      dcola = Drink.new("ダイエットコーラ", Time.now-3000000+rand(10000000))
      insert(dcola, 120)
      tea = Drink.new("お茶", Time.now-3000000+rand(10000000))
      insert(tea, 120)
    end
  end
end

class Drink
  attr_reader :name, :expire_time

  def initialize(name, time)
    @name = name
    @expire_time = time
  end
end

class Money
  attr_reader :price

  def initialize(price)
    @price = price
  end
end
