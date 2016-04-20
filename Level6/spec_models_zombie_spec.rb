describe Zombie do
	it 'validates presence of name' do
		zombie = Zombie.new(name: nil)
		#Use custom matcher to replace the following two lines
		#zombie.valid?
		#zombie.errors.should have_key(:name)
		
		#Custom matcher
		zombie.should validate_presence_of(:name).with_message('been eaten')
	end
end