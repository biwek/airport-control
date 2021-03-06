require_relative '../lib/weather_container'

class WeatherCondition; include WeatherContainer; end

describe WeatherContainer do 

	it "should return either stormy or sunny weather condition" do  
		weather = WeatherCondition.new
		expect(weather.weather_condition).to satisfy {|w| [:sunny, :stormy].include? (w)}
	end

end