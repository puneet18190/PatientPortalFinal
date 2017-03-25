class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :practice, index: true, foreign_key: true
      t.date :date
      t.time :time
      t.integer :price, default: 200
      t.integer :total,  default: 300

      t.timestamps null: false
    end
  end
end
