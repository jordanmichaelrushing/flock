json.extract! stock_quote, :id, :created_at, :updated_at
json.url stock_quote_url(stock_quote, format: :json)
