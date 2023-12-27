class CreateDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :departments do |t|
      t.string :department_code
      t.string :department_name
      t.references :hospital, null: false, foreign_key: true

      t.timestamps
    end
  end
end
