class SearchController < ApplicationController
	def index
	end

	def search_by_name(naam)
		if params[:naam]
			@companies = Company.find(:all, :conditions => ["naam = ?", "%#{naam}%"])
	  	else
			@companies = []
	  	end
	end

	def search_by_ondernemingsnummer
		@companies = Company.find(:all, :conditions => ["ondernemingsnummer = ?", "0820.371.560"])
		respond_to do |format|
			format.html # search.html.erb
			format.xml  { render :xml => @companies }
		end	
	end
	def search_by_sector
		@companies = Company.find(:all, :conditions => ["sector = ?", "Amussement"])
		respond_to do |format|
			format.html # search.html.erb
			format.xml  { render :xml => @companies }
		end	
	end
	def search_by_regio
		@companies = Company.find(:all, :conditions => ["regio = ?", "Oost-Vlaanderen"])
		respond_to do |format|
			format.html # search.html.erb
			format.xml  { render :xml => @companies }
		end	
	end
end
