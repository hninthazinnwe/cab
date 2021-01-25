class CreateCabs < ActiveRecord::Migration[6.1]
  def change
    create_table :cabs do |t|
      t.column :plate_number, :text
      t.column :model, :text
      t.column :mileage, :float
      t.column :car_photo, :binary
      t.timestamps
    end
  end

  def down
    drop_table :cabs
  end
end
