class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :number
      t.datetime :occured_at
      t.integer :payment
      t.boolean :payment_stat
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
