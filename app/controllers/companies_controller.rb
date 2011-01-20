class CompaniesController < ApplicationController

	def search_all
		@companies = Company.search_all(params[:name], params[:nummer], params[:regioNummer], params[:sectorNummer]) || []
	end
  # GET /companies
  # GET /companies.xml
  def index
    @companies = Company.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companies }
      format.xml  { render :xml => @regios }
    end
  end


  # GET /companies/1
  # GET /companies/1.xml
  def show
    @company = Company.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.xml
  def new
    @company = Company.new
@regios = Regio.find(:all)
@sectors = Sector.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  # POST /companies.xml
  def create
    @company = Company.new(params[:company])
    session[:company]=@company
        redirect_to payment_url
  end

  # PUT /companies/1
  # PUT /companies/1.xml
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to(@company, :notice => 'Company was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to(companies_url) }
      format.xml  { head :ok }
    end
  end
end
