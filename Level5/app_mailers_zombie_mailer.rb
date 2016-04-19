class ZombieMailer < ActionMailer::Base
	def welcome(zombie)
		mail(from: 'admin@codeschool.com', to: zombie.email, subject: 'Welcome Zombie!')
	end
end