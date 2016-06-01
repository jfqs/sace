class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :student, references: :user
      t.references :secretary, references: :user
      t.integer :state
      t.timestamps null: false
    end

    add_foreign_key :enrollments, :users, column: :student_id
    add_foreign_key :enrollments, :users, column: :secretary_id
  end
end
