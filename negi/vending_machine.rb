class Money

  attr_reader :value

  def initialize(value)
    @value = value
  end

end

class Drink

  attr_reader :name
  attr_reader :costs
  attr_reader :stocks

  def initialize(name, costs, stocks)
    @name = name
    @costs = costs
    @stocks = stocks
  end

end

class VendingMachine

  attr_reader :total_money
  attr_reader :all_stocks

  AVAILABLE_MONEY = [10, 50, 100, 500, 1000]

  def initialize
    @total_money = 0
    @all_stocks = [
      Drink.new('コーラ', 120, 5)
    ]
  end

  def all_stocks
    @all_stocks.each do |stock|
      puts "名前: #{stock.name} 値段: #{stock.costs} 在庫: #{stock.stocks}"
    end
  end

  def total_money
    puts "投入金額合計 #{@total_money} 円"
  end

  def insert_money(money)
    begin
      raise StandardError unless AVAILABLE_MONEY.include?(money.value)
    rescue
      puts 'このお金は使えません'
      refund_money(money.value)
    else
      @total_money += money.value.to_i
      total_money
    end
  end

  def return_money
    refund_money(@total_money)
    reset_total_money
  end

  private

  def reset_total_money
    @total_money = 0
  end

  def refund_money(money_value)
    puts "#{money_value} 円払い戻し"
  end

end


# 実行
vm = VendingMachine.new
money1 = Money.new(1)
money5 = Money.new(5)
money10 = Money.new(10)
money50 = Money.new(50)
money100 = Money.new(100)
money500 = Money.new(500)
money1000 = Money.new(1000)
money2000 = Money.new(2000)
money5000 = Money.new(3000)
money10000 = Money.new(10000)
