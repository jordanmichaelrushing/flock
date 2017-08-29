# Stock Table Schema
#
# id           integer
# name         string(255)
# exchange_id  integer

class Stock < ApplicationRecord
  belongs_to :exchange
  has_many   :stock_quotes
end
