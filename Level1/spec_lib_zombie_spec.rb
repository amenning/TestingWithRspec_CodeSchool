require 'spec_helper'
require "zombie"

describe Zombie do
  it "is named Ash" do
    zombie = Zombie.new
    zombie.name.should == 'Ash'
  end
  
  it "has no brains" do
    zombie = Zombie.new
    zombie.brains.should < 1
  end
  
  #Other examples
  #zombie.alive.should == false OR zombie.alive.should be_false
  #zombie.rotting.should == true OR zombie.alive.should be_true
  #zombie.height.should > 5 OR zombie.brains.should be < 1
  #zombie.height.should_not == 5
  
  it 'is hungry' do
    zombie = Zombie.new
    #Below are 3 ways to assert the same thing
    zombie.should be_hungry
    #OR zombie.hungry?.should == true
    #OR zombie.hungry?.should be_true
  end
end
