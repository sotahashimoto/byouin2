class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|

      t.string :title
      t.text :body
      t.string :department
      t.timestamps
    end
  end
end
