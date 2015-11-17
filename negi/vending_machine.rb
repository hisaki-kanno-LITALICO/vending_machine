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

  def be_in_stock?
    @stocks >= 0
  end

  def reduce_stock
    @stocks -= 1
  end

end

class VendingMachine

  attr_reader :total_money
  attr_reader :all_stocks
  attr_reader :sales #売上

  # 使用できるお金
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000]

  def initialize
    @total_money = 0
    @all_stocks = [
      Drink.new('コーラ', 120, 5),
      Drink.new('レッドブル', 200, 5),
      Drink.new('水', 100, 5)
    ]
    @sales = 0
  end

  # 全在庫リスト
  def all_stocks
    @all_stocks.each do |stock|
      puts "名前: #{stock.name} 値段: #{stock.costs} 在庫: #{stock.stocks}"
    end
  end

  # 投入額
  def total_money
    puts "投入金額合計 #{@total_money} 円"
  end

  # お金投入
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

  # 釣り銭
  def return_money
    refund_money(@total_money)
    reset_total_money
  end

  # 購入可能なドリンクリスト
  def purchase_possible_list
    @all_stocks.reject! { |drink| !purchase_possible?(drink) }
    all_stocks
  end

  # 購入
  def purchase(drink)
    if purchase_possible?(drink)
      drink.reduce_stock
      add_sales(drink)
      puts "#{drink.name}を購入しました"
    end
  end

  private

    def reset_total_money
      @total_money = 0
    end

    def refund_money(money_value)
      puts "#{money_value} 円払い戻し"
    end

    def salable?(money, costs)
      money >= costs
    end

    def add_sales(drink)
      @sales += drink.costs
    end

    def purchase_possible?(drink)
      salable?(@total_money, drink.costs) && drink.be_in_stock?
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
vm.insert_money(money500)
