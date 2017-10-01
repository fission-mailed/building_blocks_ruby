stock_prices = []
puts "\nPlease enter the stock prices for each day. Separate your values using commas."
#	Cleaning the user input up
user_input = gets.chomp
user_input = user_input.gsub(" ","")
user_input = user_input.split(",")

user_input.each do |price|
	stock_prices << price.to_f
end

def stock_picker(prices)
	#	Default values
	best_buy_day = 0
	best_sell_day = 0
	best_profit = prices[best_sell_day] - prices[best_buy_day]
	buy_day = 0
	
	while(buy_day < prices.length - 1)	#	No point buying on last day
	
		((buy_day + 1)...prices.length).each do |sell_day|
		#	No point selling on the same day as buying (this can lead to a loss)
			if prices[sell_day] - prices[buy_day] > best_profit
				best_buy_day = buy_day
				best_sell_day = sell_day
				best_profit = prices[sell_day] - prices[buy_day]
			end
			
		end
		
		buy_day += 1
	end
	
	puts "[#{best_buy_day}, #{best_sell_day}] => #{best_profit}"
end

stock_picker(stock_prices)