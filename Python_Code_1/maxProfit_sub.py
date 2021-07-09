def max_profit(prices):

    max_profit = 0
    purchase_day=0
    sales_day= 0

    n = len(prices)

    for i in range(0,n -1):
        for j in range(i + 1 , n):
            profit = prices[j] - prices[i]
            if profit > max_profit:
                purchase_day = i
                sales_day= j
                max_profit = profit

    return  purchase_day,sales_day,max_profit