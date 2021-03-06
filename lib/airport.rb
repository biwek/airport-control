require_relative "./weather_container"

class Airport 

	include WeatherContainer

	DEFAULT_CAPACITY = 10

	def initialize(arg = {})
		@plane = plane
		self.capacity = arg.fetch(:capacity, DEFAULT_CAPACITY)
	end

	def plane
		@plane ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def has_plane?
		!@plane.empty?
	end

	def plane_landed(plane)
		raise "Sorry, Airport is FULL!!" if full?
		raise "ALERT - BAD WEATHER. DO NOT LAND" if weather_condition == :stormy
		@plane << plane
	end

	def plane_taken_off(plane)
		raise "ALERT - BAD WEATHER. CANNOT TAKE OFF" if weather_condition == :stormy
		@plane.delete(plane)
	end

	def full?
		@plane.count == @capacity
	end

end

