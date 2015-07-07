class Post < ActiveRecord::Base

	before_save :sanitise_url

	def sanitise_url
		u = URI.parse(url)
		if !u.scheme
			self.url = "http://#{url}"
		end
	end


end
