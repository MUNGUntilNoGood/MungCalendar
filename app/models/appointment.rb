class Appointment < ApplicationRecord
	validates :eventName, presence: true
	validates :from, presence: true
	validates :to, presence: true
end