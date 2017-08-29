nyse = Exchange.create(name: 'NYSE')
nasdaq = Exchange.create(name: 'NASDAQ')

goog = Stock.create(name: 'GOOG', exchange_id: nasdaq.id)
aapl = Stock.create(name: 'AAPL', exchange_id: nyse.id)

quote1 = StockQuote.create(amount: 19.99, stock_id: goog.id)
quote1 = StockQuote.create(amount: 14.99, stock_id: aapl.id)