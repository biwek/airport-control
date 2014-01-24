class Airport 

	def initialize(plane = [])
		@planes = plane
	end

	def has_planes?
		!@planes.empty?
	end

	def plane_landed(plane)
		@planes = plane.land
	end

	def plane_taken_off(plane)
		@planes = plane.take_off
	end

end