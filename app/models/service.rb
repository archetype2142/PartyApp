class Service < ActiveRecord::Base
	belongs_to :service_provider
	validates_presence_of :description, :location, :service_name, :price
end
