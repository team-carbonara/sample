class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :type
      t.string :employee_number
      t.string :name
      t.string :e_mail
      t.string :password_digest
      t.string :address
      t.string :tel_number

      t.timestamps
    end
  end
end
