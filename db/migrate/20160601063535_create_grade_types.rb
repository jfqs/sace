class CreateGradeTypes < ActiveRecord::Migration
  def change
    create_table :grade_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
