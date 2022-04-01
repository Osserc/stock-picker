def stock_picker(stock_history)
    differentials = Array.new(stock_history.length - 1) { Array.new() }
    puts differentials
    i = 0
    shift = 1
    stock_history.each_with_index do | element, index | 
        while index + shift < stock_history.length do
            differentials[i].push (- stock_history[index] + stock_history[index + shift])
            shift += 1
        end
        shift = 1
        i += 1
    end
    k = 0
    max_profit = differentials.flatten.max_by { | element | + element}
    trading_days = Array.new()
    differentials.each_with_index do | element, index |
        if element.include?(max_profit)
                trading_days.push ("#{index}".to_i)
                trading_days.push (element.index(max_profit))
        end
    end
        puts "Buy for $" + (stock_history[trading_days[0]]).to_s + " on day " + (trading_days[0] + 1).to_s +
        " and sell for $" + stock_history[trading_days[1] + trading_days[0] + 1].to_s +
        " on day " + (trading_days[1] + trading_days[0] + 2).to_s +
        " for a profit of $" + max_profit.to_s
end

stock_picker([17,3,6,9,15,8,6,1,10])

# I was trying to account for multiple trading opportunities but I got stuck, I;leaving the code here in case anyone
#  wants to take a stab at it
# def stock_picker(stock_history)
#     differentials = Array.new(stock_history.length - 1) { Array.new() }
#     puts differentials
#     i = 0
#     shift = 1
#     stock_history.each_with_index do | element, index | 
#         while index + shift < stock_history.length do
#             differentials[i].push (- stock_history[index] + stock_history[index + shift])
#             shift += 1
#         end
#         shift = 1
#         i += 1
#     end
#     k = 0
#     max_profit = differentials.flatten.max_by { | element | + element}
#     opportunities = differentials.flatten.count(max_profit)
#     trading_days = Array.new(opportunities) { Array.new() }
#     differentials.each_with_index do | element, index |
#         if element.include?(max_profit)
#             while k < opportunities do
#                 trading_days[k].push ("#{index}".to_i)
#                 trading_days[k].push (element.index(max_profit))
#                 k += 1
#             end
#         end
#     end
#     trading_days.each do | element |
#         puts "Buy for $" + (stock_history[element[0]]).to_s + " on day " + (element[0] + 1).to_s +
#         " and sell for $" + stock_history[element[1] + element[0] + 1].to_s +
#         " on day " + (element[1] + element[0] + 2).to_s +
#         " for a profit of $" + max_profit.to_s
#     end
# end