class CreateStockQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_quotes do |t|
      t.decimal :amount
      t.integer :stock_id
      # t.integer :user_id

      t.timestamps
    end
  end
end
