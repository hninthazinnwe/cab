class CreateCabs < ActiveRecord::Migration[6.1]
  def self.change
    create_table :cabs do |t|
      t.column :plate_number, :text
      t.column :model, :text
      t.column :mileage, :float
      t.column :car_photo, :binary
    end
  end

  def self.up
    create_table :cabs do |t|
      t.column :plate_number, :text
      t.column :model, :text
      t.column :mileage, :float
      t.column :car_photo, :binary
    end
  end

  def self.down
    drop_table :cabs
  end
end
