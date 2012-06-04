module SessionsHelper
	module ClassMethods
		
	end
	
	module InstanceMethods
		
	end

	def current_user?(user)
    	user == current_user
	end
	
	def self.included(receiver)
		receiver.extend         ClassMethods
		receiver.send :include, InstanceMethods
	end
end
