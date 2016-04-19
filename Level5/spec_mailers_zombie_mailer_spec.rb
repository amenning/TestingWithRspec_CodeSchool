describe ZombieMailer do
	context '#welcome' do
		let(:zombie) { stub(email: 'ash@zombieemail.com') }
		subject { ZombieMailer.welcome(zombie) }
		
		its(:from) { should include('admin@codeschool.com') }
		its(:to)  { should include(zombie.email) }
		its(:subject) { should == "Welcome Zombie!" }
	end
end