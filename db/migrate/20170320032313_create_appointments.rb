class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :practice, index: true, foreign_key: true
      t.date :date
      t.time :time
      t.integer :price
      t.integer :tax, default: 100
      t.integer :coverage, default: 150
      t.integer :total

      t.timestamps null: false
    end
  end
end
