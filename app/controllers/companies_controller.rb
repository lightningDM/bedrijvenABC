class CompaniesController < ApplicationController
  before_filter :authenticate_company!, :only=>:currentcompany
 
  def search_all
    @companies = Company.search_all(params[:name], params[:nummer], params[:regioNummer].to_s, params[:sectorNummer].to_s) || []
  end

  # GET /companies
  # GET /companies.xml
  def index
    @companies = Company.paginate :page=>params[:page], :per_page => 5

     #redirect_to search_all
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @companies }
      format.xml { render :xml => @regios }
    end
  end

  def log_out
    sign_out current_company
    redirect_to root_path
  end

  def currentcompany
       @company = Company.find(current_company)
        redirect_to companies_url+"/"+@company.id.to_s
  end
  # GET /companies/1
  # GET /companies/1.xml
  def show

      @company = Company.find(params[:id])


  


    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.xml
  def new
    @company = Company.new
    @regios  = Regio.find(:all)
    @sectors = Sector.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  def sign
    @company=params[:company]
    sign_in  @company
    redirect_to root_path


  end
  # POST /companies
  # POST /companies.xml
  def create
    @company         = Company.new(params[:company])
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
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @company.errors, :status => :unprocessable_entity }
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
      format.xml { head :ok }
    end
  end
end
