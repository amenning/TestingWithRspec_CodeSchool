#run the code with the following command to run the tests
#rspec spec/models/zombie_spec.rb

require 'spec_helper'

describe Zombie do
  it 'is invalid without a name' do
    zombie = Zombie.new
    zombie.should_not be_valid
  end
  
  it "has a name that matches 'Ash Clone'" do
    zombie = Zombie.new(name: "Ash Clone 1")
    zombie.name.should match(/Ash Clone \d/)
  end
  
  describe Zombie do
    it 'include tweets' do
      tweet1 = Tweet.new(status: 'Uuuuunhhhhh')
      tweet2 = Tweet.new(status: 'Arrrrgggg')
      zombie = Zombie.new(name: 'Ash', tweets: [tweet1, tweet2])
      zombie.tweets.should include(tweet1)
      zombie.tweets.should include(tweet2)
    end
  end
  
  it 'starts with two weapons' do
    zombie = Zombie.new(name: 'Ash')
    #zombie.weapons.count.should == 2
    #OR
    zombie.should have(2).weapons
    #OR have_at_least(n) OR have_at_most(n)
  end
  
  it 'changes the number of Zombies' do
    zombie = Zombie.new(name: 'Ash')
    expect { zombie.save }.to change { Zombie.count }.by(1)
    #Other options by(n), from(n), to(n)
    #Can chain options .from(n).to(5)
  end
  
  it 'raises an error if saved without a name' do
    zombie = Zombie.new
    expect { zombie.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
    #also can use not_to or to_not modifiers
  end
  
  #Other example matchers
  #@zombie.should respond_to(hungry?)
  #@width.should be_within(0.1).of(33.3)
  #@zombie.should exist
  #@zombie.should satisfy { |zombie| zombie.hungry? }
  #@hungry_zombie.should be_kind_of(Zombie)
  #@status.should be_an_instance_of(String) 
  
end
