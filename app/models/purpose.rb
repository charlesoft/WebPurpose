class Purpose < ActiveRecord::Base

	#Validations
	validates :name, presence: true, length: {minimum: 2}
	validates :description, presence: true
	validates :value, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :city, presence: true
	
end
