def productSales(productList, sales_cnt,survey_grade):

    product_dics= {}

    good_products, bad_products = [],[]


    for pro in productList:
        dataList = pro.split('/')
        product_dics[dataList[0]] = (int(dataList[1]), int(dataList[2]))


    for key in list(product_dics.keys()):

        if product_dics[key][0] >= sales_cnt and product_dics[key][1]   >= survey_grade:
            good_products.append(key)

        elif product_dics[key][0] < sales_cnt and product_dics[key][1] < survey_grade :
            bad_products.append(key)

    good_products =sorted(good_products)
    bad_products=sorted(bad_products)
    return good_products,bad_products

