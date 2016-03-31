shared_examples_for 'the undead' do
  it 'does not have a pulse' do
    undead.pulse.should == false
  end
end
