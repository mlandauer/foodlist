class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :transaction, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.float :quantity
      t.float :total_ex_gst
      t.float :total_inc_gst
      t.integer :line_no

      t.timestamps null: false
    end
  end
end
