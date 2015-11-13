class VendingMachine
  def initialize
    @money = 0
    @available_money = [10, 50,100, 500, 1000]
    @juices = Hash.new { |h,k| h[k] = {} }
    @juices[:cola]= {name: "コーラ", price: 120, quantity: 5}
  end

  def insert(money)
    if @available_money.include?(money)
      @money += money
      p "投入金額#{@money}"
    else
      p "#{@money}円を返却"
      p "投入金額#{@money}"
    end
  end

  def create(juice, name, price, quantity)
    @juices[juice.to_sym] = {name: name, price: price, quantity: quantity}
  end
end
