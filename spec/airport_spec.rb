require_relative '../lib/airport'

describe Airport do  

	let(:airport) {Airport.new}
	
	it "should not contain planes" do  
		expect(airport).not_to have_planes
	end

	it "should allow planes to land" do 
		planes = double :planes
		expect(planes).to receive(:land)
		airport.plane_landed(planes)
	end

	it "should contain a plane after it has landed" do  
		airport1 = Airport.new(:plane)
		planes = double :planes
		expect(planes).to receive(:land)
		airport.plane_landed(planes)
		expect(airport1).to have_planes
	end

	it "should allow planes to take off" do 
		airport1 = Airport.new(:plane)
		planes = double :planes
		expect(airport1).to have_planes
		expect(planes).to receive(:take_off)
		airport1.plane_taken_off(planes)
	end

	it "should not contain a plane after it has taken off" do 
		planes = double :planes
		airport1 = Airport.new(:plane)
		expect(planes).to receive(:take_off)
		airport1.plane_taken_off(planes)
		expect(airport1).not_to have_planes
	end

end
