class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :year
      t.integer :bimester

      t.timestamps null: false
    end
  end
end
