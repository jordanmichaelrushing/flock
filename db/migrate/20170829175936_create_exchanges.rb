class CreateExchanges < ActiveRecord::Migration[5.0]
  def change
    create_table :exchanges do |t|
      t.string  :name
      t.string  :location
      t.boolean :active, default: true

      t.timestamps
    end

    add_index :exchanges, [:name]
    add_index :exchanges, [:active]
  end
end
