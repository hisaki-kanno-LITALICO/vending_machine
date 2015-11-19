class VendingMachine
  def initialize
    @money = 0
    @available_money = [10, 50,100, 500, 1000]
    @juices = Hash.new { |h,k| h[k] = {} }
    @juices[0]= {name: "コーラ", price: 120, quantity: 5}
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

  def create(name, price, quantity)
    @juices[@juices.length] = {name: name, price: price, quantity: quantity}
  end

  def list
    @juices.each do |id, juice|
      if juice[id][:price].to_i < @money && juice[id][:quantity] > 0
        p juice[id][:name]
      end
    end
  end
end
