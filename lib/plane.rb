class Plane

	def initialize 
		@status = "Flying"
	end

	def status
		@status
	end

	def landed(airport)
		airport.plane_landed(self)
		@status = "Landed"
	end

	def take_off(airport)
		airport.plane_take_off(self)
		@status = "Flying"
	end

	def in_the_air?
		@status == "Flying"
	end

end