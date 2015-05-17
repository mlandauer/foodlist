class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :code
      t.date :date
      #t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
