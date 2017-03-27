class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.string :dr_first_name
      t.string :dr_last_name
      t.integer :experience
      t.string :speciality
      t.string :address
      t.text :professional_statement
      t.boolean :is_insurance
      t.references :user, index: true, foreign_key: true
      t.string :insurance
      t.integer :zip_code
      t.integer :price
      t.boolean :active

      t.timestamps null: false
    end
  end
end
