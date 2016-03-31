describe Zombie do
  let(:zombie) { Zombie.new }
  #Hook with before, before(:each), before(:all), after(:each), after(:all)
  before { zombie.hungry! }
  
  it 'is hungry' do
    #zombie.hungry!
    zombie.should be_hungry
  end
  
  it 'craves brains' do
    #zombie.hungry!
    zombie.should be_craving_brains
  end
  
  
  context 'with a veggie preference' do
    before { zombie.vegetaria = true }
    it 'still craves brains' do
      #zombie.vegetarian = true
      #...
    end
    it 'craves vegan brain' do
      #zombie.vegetarian = true
      #...
    end
  end
  
  
  #Shared examples using separate support_shared_examples_for_undead.rb file
  it_behaves_like 'the undead' do
    let(:undead) { Zombie.new }
  end
  
  
  #Metadata and filters
  #Run only :focus examples by using following command
  #rspec --tag focus spec/lib/zombie_spec.rb
  context 'when hungry' do
    it 'wants brains' 
    context 'with a veggie preference', focus: true do
      it 'still craves brains'
      it 'prefers vegan brains', vegan: true
    end
  end
  
  
  
end