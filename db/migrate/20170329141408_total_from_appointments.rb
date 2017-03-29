class TotalFromAppointments < ActiveRecord::Migration
  def up
    remove_column :appointments, :total
    remove_column :appointments, :coverage
    remove_column :appointments, :tax
  end

  def down
    add_column :appointments, :total, :integer
    add_column :appointments, :total, :integer
    add_column :appointments, :total, :integer
  end
end
