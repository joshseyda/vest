class CreateHoldings < ActiveRecord::Migration[5.2]
  def change
    create_table :holdings do |t|
      t.string :symbol
      t.string :holding_type
      t.timestamps
    end
  end
end
