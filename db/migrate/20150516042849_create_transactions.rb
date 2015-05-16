class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :code
      t.date :date

      t.timestamps null: false
    end
  end
end
