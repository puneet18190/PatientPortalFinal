class ChangeZipDataType < ActiveRecord::Migration
  def change
  	change_column :practices, :zip_code, :string
  end
end
