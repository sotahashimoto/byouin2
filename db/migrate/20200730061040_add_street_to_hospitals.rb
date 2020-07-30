class AddStreetToHospitals < ActiveRecord::Migration[5.2]
  def change
    add_column :hospitals, :street, :string
  end
end
