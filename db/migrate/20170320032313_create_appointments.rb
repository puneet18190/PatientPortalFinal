class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :practice, index: true, foreign_key: true
      t.date :date
      t.time :time
      t.string :reason
      t.integer :price
      t.integer :tax, default: 100
      t.integer :coverage, default: 50
      t.integer :total, default: 400

      t.timestamps null: false
    end
  end
end
