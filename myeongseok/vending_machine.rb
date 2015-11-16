class Test
	def initialize
		@sum = 0
	end

	def init_display
		p 'コインを入れてください, 0: 返金, -1:投入額を確認'
		amount = gets.chomp.to_i
		if amount == 10 || amount == 50 || amount == 100 || amount == 500 || amount == 1000
			insert_coin(amount)
		elsif amount == 0
			p '返金します' + @sum.to_s
			@sum = 0
			init_display
		elsif amount == -1
			p '投入金額' + @sum.to_s
			init_display
		else
			p '入力ミス、見直してください'
			init_display
		end
	end

	def insert_coin(amount)
		save_money(amount)
	end

	def save_money(amount)
		@sum = @sum + amount
		p @sum
		init_display
	end
end

test = Test.new
test.init_display