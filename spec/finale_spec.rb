require_relative '../lib/airport'
require_relative '../lib/plane'

describe "The Grand Finale" do  

	let(:airport) { Airport.new(:capacity => 6)}
	let(:sixplanes) { Array.new(6) { Plane.new } }


	it "all planes can land and all planes can take off" do

		sixplanes.each do |plane| 
			while plane.status == "Flying"
				begin
					plane.land(airport) 
				rescue => e
					"Ready to land"
				end
			end
			expect(plane.status).to eq("Landed")
		end

		expect(airport).to be_full

		sixplanes.each do |plane| 
			while plane.status == "Landed"
				begin 
					plane.take_off(airport)
				rescue => e
					"Ready for take off"
				end
			end
			expect(plane.status).to eq("Flying")
		end

		expect(airport).not_to have_plane

	end
end