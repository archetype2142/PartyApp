class AddServicesToServiceProvider < ActiveRecord::Migration
  def change
    add_reference :service_providers, :services, index: true, foreign_key: true
  end
end
