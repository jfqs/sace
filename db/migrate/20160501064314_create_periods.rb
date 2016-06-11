class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :year
      t.integer :bimester
      t.integer :state, default: 0
      t.timestamps null: false
    end
  end
end
