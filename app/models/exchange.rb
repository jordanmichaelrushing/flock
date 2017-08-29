# Exchange Table Schema
#
# id              integer
# name      string(255)
# location  string(255)
# active    boolean(default: true)


class Exchange < ApplicationRecord
  has_many :stocks
  has_many :stock_quotes, through: :stocks
  has_many :transactions, through: :stock_quotes

  # If new exchanges become available and we want to support them,
  # add their names here
  VALID_NAMES = ['NASDAQ', 'NYSE']

  validates :name, inclusion: { in: VALID_NAMES, message: "Exchange must be one of these: #{VALID_NAMES.join(', ')}" }
  validates_uniqueness_of :name
end
