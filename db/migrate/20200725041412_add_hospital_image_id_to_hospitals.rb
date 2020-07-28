class AddHospitalImageIdToHospitals < ActiveRecord::Migration[5.2]
  def change
    add_column :hospitals, :hospital_image_id, :string
  end
end
