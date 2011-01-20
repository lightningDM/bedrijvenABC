class SearchController < ApplicationController
	def index
		@regios= Regio.all
		@sectors= Sector.all
	end
end
