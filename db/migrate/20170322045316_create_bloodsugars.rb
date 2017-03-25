class CreateBloodsugars < ActiveRecord::Migration
  def change
    create_table :bloodsugars do |t|
      t.references :user, index: true, foreign_key: true
      t.float :fasting
      t.float :nonfasting
      t.string :unit
      t.datetime :date

      t.timestamps null: false
    end
  end
end
