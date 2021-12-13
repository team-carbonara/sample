class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :number
      t.string :name
      t.float :unit_price
      t.string :image
      t.text :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
