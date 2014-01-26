require_relative '../lib/airport'
require_relative '../lib/plane'

describe "The Grand Finale" do  

	let(:airport) { Airport.new(:capacity => 6)}
	let(:planes) { Array.new(6, Plane.new) }


	it "all planes can land and all planes can take off" do

		# airport.stub(:weather_condition).and_return(:sunny)
		planes.each do |plane| plane.land(airport) 
			expect(plane.status).to eq("Landed")
		end
		expect(airport).to be_full
		planes.each do |plane| plane.take_off(airport)
			expect(plane.status).to eq("Flying")
		end
	end

end