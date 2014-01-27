class Plane

	def initialize 
		@status = "Flying"
	end

	def status
		@status
	end

	def land(airport)
		airport.plane_landed(self)
		@status = "Landed"
	end

	# Here you have two methods that delegate most of the work to the airport
	# but still update the status.
	# The problem is that if I ask the airport to accept a plane, the status isn't going to be updated.
	# And if I'm not supposed to use these methods on the airport, then they shouldn't exist
	# A better approach would be to only have these methods in the airport and let the airport
	# ask the plane to update its status. This way there's only one way to get a plane into the airport
	# and it's guaranteed to update the plane's status.
	def take_off(airport)
		airport.plane_taken_off(self)
		@status = "Flying"
	end

	def in_the_air?
		@status == "Flying"
	end

	def has_landed?
		@status == "Landed"
	end

end