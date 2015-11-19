class Machine
  attr_reader :products, :earnings

  def initialize
    @inserted_amount = 0
    @can_be_charged_money = [10, 50, 100, 500, 1000]
    @earnings = 0
    @products = []
  end

  def display
    p 'コインを入れてください, -1:投入額を確認, -2: 返金, -3: 購入できる商品リスト表示, -4: 購入'
    number = gets.chomp.to_i
    if @can_be_charged_money.include?(number)
      insert_coin(number)
    elsif number == -1
      p '投入されている金額' + @inserted_amount.to_s
      display
    elsif number == -2
      p '返金します' + @inserted_amount.to_s
      @inserted_amount = 0
      display
    elsif number == -3
      check_list_purchasable_products
    elsif number == -4
      buy_product
    else
      p "#{number}は入力ミスです、見直してください"
      display     
    end
  end

  def add_product_to_machine(product)
    @products << product
  end

  def insert_coin(money)
    save_money_to_machine(money)
  end

  def save_money_to_machine(money)
    @inserted_amount = @inserted_amount + money
    p @inserted_amount
    display
  end

  def check_list_purchasable_products
    @products.each do |product|
      if product.product_stock > 0 && @inserted_amount >= product.product_price
        p product.product_name
      end
    end
    display
  end

  def buy_product
    product_number = 0
    p '商品番号を入力してください'
    @products.each do |product|
      p "#{product_number} : #{product.product_name} "
      product_number += 1
    end
    input_product_number = gets.chomp.to_i
    if input_product_number < @products.size
      calculate(input_product_number)
    else
      buy_product
    end
  end

  def calculate(product_number)
    product = @products[product_number]
    if product.product_stock <= 0
      p 'no stock'
    elsif @inserted_amount < product.product_price
      p 'no enough money'
    else
      @inserted_amount = @inserted_amount - product.product_price
      @products[product_number].product_stock = product.product_stock - 1
      @earnings = @earnings + product.product_price
      p 'thankx'
    end
    display
  end
end

class Drink
  attr_reader :product_name
  attr_accessor :product_price, :product_stock

  def initialize(product_name, product_price, product_stock)
    @product_name = product_name
    @product_price = product_price
    @product_stock = product_stock
  end
end
