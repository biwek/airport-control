require_relative '../lib/plane'

describe Plane do  

	let(:plane) { Plane.new }
	let(:airport) { double :airport }

	it "has a flying status when created" do 
		expect(plane.status).to eq("Flying") 
	end

	it "has a flying status when in the air" do 
		# these two are the same thing, prefer to use in_the_air? method instead of reading status
		expect(plane).to be_in_the_air
		expect(plane.status).to eq("Flying")
	end

	it "has a landed status when at airport" do  
		expect(airport).to receive(:plane_landed)
		plane.land(airport)
		expect(plane.status).to eq("Landed")
	end

	it "changes its status to flying after taking off" do  
		expect(airport).to receive(:plane_landed)
		plane.land(airport)
		expect(plane.status).to eq("Landed")
		expect(airport).to receive(:plane_taken_off)
		plane.take_off(airport)
		expect(plane.status).to eq("Flying")
	end

end
