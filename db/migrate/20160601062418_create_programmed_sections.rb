class CreateProgrammedSections < ActiveRecord::Migration
  def change
    create_table :programmed_sections do |t|
      t.references :period, index: true, foreign_key: true
      t.references :section, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.references :teacher, references: :user
      t.string :desc
      t.integer :day
      t.integer :start_time
      t.integer :end_time

      t.timestamps null: false
    end

    add_foreign_key :programmed_sections, :users, column: :teacher_id
    add_index :programmed_sections, :teacher_id
  end
end
