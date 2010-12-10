class SectorsController < ApplicationController
	
  def index
    @sectors = Sector.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sectors }
    end
end
  end


