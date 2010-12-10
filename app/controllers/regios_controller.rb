class RegiosController < ApplicationController
	
  def index
    @regios = Regio.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @regios }
    end
end
  end


