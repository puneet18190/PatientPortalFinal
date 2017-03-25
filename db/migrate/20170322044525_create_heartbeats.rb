class CreateHeartbeats < ActiveRecord::Migration
  def change
    create_table :heartbeats do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :count
      t.date :date
      t.string :msr ,  default: "BPM"

      t.timestamps null: false
    end
  end
end
