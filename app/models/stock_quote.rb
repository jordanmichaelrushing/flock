# StockQuote Schema
#
# id        integer
# amount    decimal
# stock_id  integer

# Commented out for now
# user_id   integer

class StockQuote < ApplicationRecord
  belongs_to :stock
  #belongs_to :user
end
