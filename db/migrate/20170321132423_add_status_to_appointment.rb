class AddStatusToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :status, :boolean
    add_column :appointments, :reason, :text
  end
end
