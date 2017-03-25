class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.references :user, index: true, foreign_key: true
      t.float :temperature
      t.string :measured
      t.datetime :date

      t.timestamps null: false
    end
  end
end
