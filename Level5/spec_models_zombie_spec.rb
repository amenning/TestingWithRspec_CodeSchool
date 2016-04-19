describe Zombie do
	let(:zombie) { Zombie.create }
	
	context "#decapitate" do
		it "calls weapon.slice" do
			zombie.weapon.should_receive(:slice)
			zombie.decapitate
		end
		
		it "sets status to dead again" do
			zombie.weapon.stub(:slice)
			zombie.decapitate
			zombie.status.should === "dead again"
		end
	end
	
	it "returns properly formatted lat, long" do
		Zoogle.should_receive(:graveyard_locator).with(zombie.graveyard).and_return({latitude: 2, longitude: 3})
		zombie.geolocate.should == "2, 3"
	end
	
	it "returns properly formatted lat, long" do
		loc = stub(latitude: 2, longitude: 3)
		Zoogle.stub(:graveyard_locator).returns(loc)
		zombie.geolocate_with_object.should == "2, 3"
	end
end