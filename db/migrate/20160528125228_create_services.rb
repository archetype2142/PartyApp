class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :service_provider_id
      t.string :service_name
      t.text :description
      t.integer :price
      t.string :location
      t.timestamps null: false
    end
  end
end
