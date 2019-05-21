module ApplicationHelper
	def mobile_device
		agent = request.user_agent
		if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
			return "tablet" 
		elsif agent =~ /Mobile/
			return "mobile" if agent =~ /Mobile/
		else
			return "desktop"
		end
	end
end
