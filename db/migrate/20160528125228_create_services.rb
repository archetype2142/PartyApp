class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.belongs_to :service_provider, index: true
      t.string :service_name
      t.text :description
      t.integer :price
      t.string :location
      t.timestamps null: false
    end
  end
end
