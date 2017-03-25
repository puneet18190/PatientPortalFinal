class CreateBloodpressures < ActiveRecord::Migration
  def change
    create_table :bloodpressures do |t|
      t.references :user, index: true, foreign_key: true
      t.float :systolic
      t.float :dystolic
      t.string :measuredd
      t.datetime :date

      t.timestamps null: false
    end
  end
end
