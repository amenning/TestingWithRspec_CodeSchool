module ValidatePresenceOfName
	class Matcher
		def initialize(attribute)
			@attribute = attribute
			@message = "can't be blank"
		end
		
		def matches?(model)
			@model = model
			@model.valid?
			errors = @model.errors[@attribute]
			errors.any? { |error| error == @message }
		end
		
		def with_message(message)
			@message = message
			self
		end
	end
	
	def failure_messagae
		"#{@model.class} failed to validate :#{@attribute} presence."
	end
	
	def negative_failure_message
		"#{@model.class} validated :#{@attribute} presenece."
	end
	
	def validate_presence_of(attribute)
		Matcher.new(attribute)
	end
end

RSpec.configure do |config|
	config.include ValidatePresenceOfName, type: :model
end