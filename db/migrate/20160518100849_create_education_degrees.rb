class CreateEducationDegrees < ActiveRecord::Migration
  def change
    create_table :education_degrees do |t|
      t.references :education_level, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
