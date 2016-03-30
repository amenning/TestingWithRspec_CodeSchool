describe Zombie do
  it 'responds to name' do
    #Old method
    #zombie = Zombie.new
    #zombie.should respond_to(:name)
    
    #New method using implicit subject
    #subject = Zombie.new
    #subject.should respond_to(:name)
    
    #Can remove subject altogether
    should respond_to(:name)
  end
  
  #The above code can also be written
  it { should respond_to(:name) }
  
  #it { subject.name.should == 'Ash' }
  #The above code can also be written
  its(:name) { should == 'Ash' }
  
  its(:weapons) { should include(weapon) }
  its(:brain) { should be_nil }
  its('tweets.size') { should == 2 }
  
  
  
  #The following can be refractored to
  #it 'craves brains when hungry'
  #it 'with a veggie preference still craves brains when hungry'
  #it 'with a veggie preference prefers vegan brains when hungry'
  
  it 'craves brains when hungry'
  describe 'with a veggie preference' do
    it 'still craves brains when hungry'
    it 'prefers vegan brains when hungry'
  end
  
  #Or even further
  describe 'when hungry' do
    it 'craves brains'
    describe 'with a veggie preference' do
      it 'still craves brains'
      it 'prefers vegan brains'
    end
  end
  
  #Or even further
  context 'when hungry' do
    it 'craves brains'
    context 'with a veggie preference' do
      it 'still craves brains'
      it 'prefers vegan brains'
    end
  end
  
  
  context 'with a veggie preference' do
    subject { Zombie.new(vegetarian: true) }
    
    it 'craves vegan brains' do
      #craving.should == 'vegan brains'
      #OR same result but
      its(:craving) { should == 'vegan brains' }
    end
  end
  
  context 'with a veggie preference' do
    subject(:zombie) { Zombie.new(vegetarian: true, weapons: [axe]) }
    let(:axe) { Weapon.new(name: 'axe') }
    
    its(:weapons) { should include(axe) }
    
    it 'can use its axe' do
      zombie.swing(axe).should == true
    end
  end
  
  
  let(:zombie) { Zombie.create }
  subject { zombie }
  
  its(:name) { should be_nil? }
    
  it { should be_craving_brains }
  
  it 'should not be hungry after eating brains' do
    expect{ zombie.eat(:brains) }.to change {
      zombie.hungry
    }.from(true).to(false)
  end  
end