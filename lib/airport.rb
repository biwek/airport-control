class Airport 

	DEFAULT_CAPACITY = 10

	def initialize(plane = [])
		@planes = plane
		@capacity ||= DEFAULT_CAPACITY
	end

	def planes
		@planes
	end

	def capacity
		@capacity
	end

	def capacity=(value)
		@capacity = value
	end

	def has_planes?
		!@planes.empty?
	end

	def plane_landed(plane)
		raise "Sorry, Airport is FULL!!" if full?
		@planes << plane
	end

	def plane_taken_off(plane)
		@planes.delete(plane)
	end

	def full?
		@planes.count == @capacity
	end

end