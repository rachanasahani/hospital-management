class CreateHospitals < ActiveRecord::Migration[7.1]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :contact
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
