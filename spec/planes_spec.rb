require_relative '../lib/plane'

describe Plane do  

	it "has a flying status when created" do 
		plane = Plane.new
		expect(plane.status).to eq("Flying")
	end

	it "has a flying status when in the air" do 
		plane = Plane.new
		expect(plane).to be_in_the_air
		expect(plane.status).to eq("Flying")
	end

	it "has a landed status when at airport" do  
		airport = double :airport
		plane = Plane.new
		expect(airport).to receive(:plane_landed)
		plane.land(airport)
		expect(plane.status).to eq("Landed")
	end

	it "changes its status to flying after taking off" do  
		airport = double :airport
		plane = Plane.new
		expect(airport).to receive(:plane_landed)
		plane.land(airport)
		expect(plane.status).to eq("Landed")
		expect(airport).to receive(:plane_taken_off)
		plane.take_off(airport)
		expect(plane.status).to eq("Flying")
	end

end
