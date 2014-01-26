require_relative '../lib/airport'

describe Airport do  

	let(:airport) {Airport.new}

	def fill_airport(plane)
		airport.capacity.times { airport.plane_landed(plane)}
	end
	
	context "Taking off and landing" do 
		it "should not contain plane" do  
			expect(airport).not_to have_plane
		end

		it "should contain a plane after it has landed" do 
			plane = double :plane
			airport.stub(:weather_condition).and_return(:sunny)
			airport.plane_landed(plane)
			expect(airport).to have_plane
			expect(airport.plane.count).to eq(1)
		end

		it "should not contain a plane after it has taken off" do 
			plane = double :plane
			airport.stub(:weather_condition).and_return(:sunny)
			airport.plane_landed(plane)
			airport.plane_taken_off(plane)
			expect(airport).not_to have_plane
			expect(airport.plane.count).to eq(0)
		end
	end

	context "Traffic Control" do  
		
		it "should not allow plane to land if full" do 
			plane = double :plane
			airport.stub(:weather_condition).and_return(:sunny)
			fill_airport(plane)
			expect { airport.plane_landed(plane) }.to raise_error("Sorry, Airport is FULL!!")
		end

		context "Weather Conditions" do

			it "should not take off if weather is stormy" do  
				plane = double :plane
				airport.stub(:weather_condition).and_return(:sunny)
				fill_airport(plane)
				airport.stub(:weather_condition).and_return(:stormy)
				expect { airport.plane_taken_off(plane) }.to raise_error("ALERT - BAD WEATHER. CANNOT TAKE OFF")
				expect(airport.plane.count).to eq(10)
			end

			it "should not land if weather is stormy" do 
				plane = double :plane
				airport.stub(:weather_condition).and_return(:stormy)
				expect { airport.plane_landed(plane) }.to raise_error("ALERT - BAD WEATHER. DO NOT LAND")
				expect(airport.plane.count).to eq(0)
			end

		end
	end
end

