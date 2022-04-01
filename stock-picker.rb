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
    puts differentials[7]
end

# def stock_picker(stock_history)
#     differentials = Array.new(stock_history.length - 1) { Array.new() }
#     puts differentials
#     i = 0
#     shift = 1
#     stock_history.each do | element, index | 
#         while i < stock_history.length - 1 do
#             differentials[i].push (- stock_history[position] + stock_history[position + shift])
#             shift += 1
#             i += 1
#         end
#     end
#     puts differentials
# end

stock_picker([17,3,6,9,15,8,6,1,10])

#  => [1,4]  # for a profit of $15 - $3 == $12