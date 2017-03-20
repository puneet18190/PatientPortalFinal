class AddFieldsToPractice < ActiveRecord::Migration
  def change
    add_column :practices, :latitude, :float
    add_column :practices, :longitude, :float
  end
end
