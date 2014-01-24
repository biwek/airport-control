module WeatherContainer

	STATES = [:sunny, :stormy]

	def weather_condition
		STATES[rand(0..1)]
	end

end