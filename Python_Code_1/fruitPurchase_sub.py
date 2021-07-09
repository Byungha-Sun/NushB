def fruitPurchase(dict):

    purchaseDics = {}

    total_expenses = 0

    for key in list(dict.keys()):

        if dict[key][1] < 5:

            partial_expense = ( 5- dict[key][1]) * dict[key][0]

            purchaseDics[key]= list(map(int, ((5- dict[key][1]), partial_expense)))

            total_expenses += partial_expense

    return  purchaseDics, total_expenses



