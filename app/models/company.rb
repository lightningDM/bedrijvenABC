class Company < ActiveRecord::Base
	def self.search_by_name(search)
	  search_condition = "%" + search + "%"
	  find(:all, :conditions => ['naam LIKE ?', search_condition])
	end
	def self.search_by_nummer(search)
	  search_condition = "%" + search + "%"
	  find(:all, :conditions => ['ondernemingsnummer LIKE ?', search_condition])
	end
end
