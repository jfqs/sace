class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :student, references: :user
      t.references :payment_type, index: true, foreign_key: true
      t.references :period, index: true, foreign_key: true
      t.integer :amount
      t.date :op_date
      t.string :op_code

      t.timestamps null: false
    end

    add_foreign_key :payments, :users, column: :student_id
  end
end
