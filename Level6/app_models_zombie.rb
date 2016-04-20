class Zombie < ActiveRecord::Base
	validates :name, presence: { message: 'been eaten' }
end