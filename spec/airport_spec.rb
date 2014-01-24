require_relative '../lib/airport'

describe Airport do  

	let(:airport) {Airport.new}

	def fill_airport(planes)
		airport.capacity.times { airport.plane_landed(planes)}
	end
	
	it "should not contain planes" do  
		expect(airport).not_to have_planes
	end

	it "should contain a plane after it has landed" do 
		planes = double :planes
		airport.plane_landed(planes)
		expect(airport).to have_planes
		expect(airport.planes.count).to eq(1)
	end

	it "should not contain a plane after it has taken off" do 
		planes = double :planes
		airport.plane_taken_off(planes)
		expect(airport).not_to have_planes
		expect(airport.planes.count).to eq(0)
	end

	it "should not allow planes to land if full" do 
		planes = double :planes
		fill_airport(planes)
		expect { airport.plane_landed(planes) }.to raise_error("Sorry, Airport is FULL!!")
	end

end
