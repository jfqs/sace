class CreateStudentGrades < ActiveRecord::Migration
  def change
    create_table :student_grades do |t|
      t.references :student, references: :user
      t.references :period, index: true, foreign_key: true
      t.references :programmed_section, index: true, foreign_key: true
      t.references :grade_type, index: true, foreign_key: true
      t.integer :score

      t.timestamps null: false
    end

    add_foreign_key :student_grades, :users, column: :student_id
    add_index :student_grades, :student_id
  end
end
