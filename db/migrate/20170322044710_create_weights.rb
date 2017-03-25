class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.references :user, index: true, foreign_key: true
      t.float :weight
      t.string :unitt
      t.datetime :date

      t.timestamps null: false
    end
  end
end
