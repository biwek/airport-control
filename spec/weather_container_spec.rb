require_relative '../lib/weather_container'

class WeatherCondition; include WeatherContainer; end

describe WeatherContainer do 

	it "should return either stormy or sunny weather condition" do  
		weather = WeatherCondition.new
    # this test may occasionally pass even if this method occasionally returns bad values,
    # so this is not a good test
		expect(weather.weather_condition).to satisfy {|w| [:sunny, :stormy].include? (w)}
	end

end