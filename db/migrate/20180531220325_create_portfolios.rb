class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.integer :user_id
      t.string :holding_type
      t.integer :holding_id
      t.integer :num_of_shares

      t.timestamps
    end
  end
end
