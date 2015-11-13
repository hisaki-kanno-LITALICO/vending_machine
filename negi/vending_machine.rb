class Coin

  attr_reader :value

  def initialize(value)
    @value = value
  end

end

class VendingMachine

  attr_accessor :total_coin

  def initialize
    @total_coin = 0
  end

  def insert_coin(coin)
    total_coin + coin.value.to_i
  end

  def refund_coin
    p total_coin
    reset_total_coin
  end

  private

  def reset_total_coin
    total_coin = 0
  end

end


# 実行
vm = VendingMachine.new
coin10 = Coin.new(10)
coin50 = Coin.new(50)
coin100 = Coin.new(100)
coin500 = Coin.new(500)
coin1000 = Coin.new(1000)
