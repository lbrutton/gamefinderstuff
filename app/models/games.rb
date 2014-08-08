class Games < ActiveRecord::Base
	has_many :game_details

	def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else
		  find(:all)
		end
	end

end
