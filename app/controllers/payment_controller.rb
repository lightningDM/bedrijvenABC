class PaymentController < ApplicationController

  def new

    if session[:company]== nil
      redirect_to new_company_registration_url
    end

  end

  def create

    if params[:company]!= nil
      begin
  @company=Company.create!(params[:company])
             session[:company]=params[:company]
  Company.delete(@company)
             redirect_to payment_url
      rescue
      @company=Company.create(params[:company])
        redirect_to new_company_registration_path, :notice => @company
      else


      end




    else


      @error=false
      if (params[:nummer] =='')
        flash[:nummer]="enter a number"
        @nummer       =''
        @error        =true
      else
        @nummer=params[:nummer]
      end
      if (params[:maand] =='')
        flash[:maand]='enter a month'
        @maand       =''
        @error       =true
      else
        @maand=params[:maand]
      end
      if (params[:jaar] =='')
        flash[:jaar]='enter a year'
        @jaar       =''
        @error      =true
      else
        @jaar=params[:jaar]
      end
      if (params[:voornaam] =='')
        flash[:voornaam]='enter a firstname'
        @voornaam       =''
        @error          =true
      else
        @voornaam=params[:voornaam]
      end
      if (params[:naam] =='')
        flash[:naam]='enter a name'
        @naam       =''
        @error      =true
      else
        @naam=params[:naam]
      end
      if (params[:controle] =='')
        flash[:controle]='enter a controlevalue'
        @controle       =''
        @error          =true

      else
        @controle=params[:controle]
      end

      if @error==false
        ActiveMerchant::Billing::Base.mode = :test

        credit_card                        =ActiveMerchant::Billing::CreditCard.new(
            :number            =>params[:nummer],
            :month             =>params[:maand],
            :year              =>params[:jaar],
            :first_name        =>params[:voornaam],
            :last_name         =>params[:naam],
            :verification_value=>params[:controle],
            :type              =>'bogus'
        )

        if credit_card.valid?
          #(redirect_to root_url, :notice => 'Company was successfully created.')
          gateway =ActiveMerchant::Billing::TrustCommerceGateway.new(
              :login    => 'TestMerchant',
              :password => 'password'
          )
          response=gateway.purchase(1000, credit_card)

          if response.success?
            @company=Company.create(session[:company])
            respond_to do |format|

              format.html { redirect_to companies_url+"/"+@company.id.to_s}
              format.xml { render :xml => @company, :status => :created, :location => @company }
              session.clear

            end
          else
            flash[:error]='invalid data'
            (redirect_to payment_url :nummer=>@nummer, :jaar=>@jaar, :maand=>@maand, :naam=>@naam, :voornaam=>@voornaam, :controle=>@controle)
          end


        else
          flash[:error]='invalid data'
          (redirect_to payment_url :nummer=>@nummer, :jaar=>@jaar, :maand=>@maand, :naam=>@naam, :voornaam=>@voornaam, :controle=>@controle)
        end
      else
        redirect_to payment_url :nummer=>@nummer, :jaar=>@jaar, :maand=>@maand, :naam=>@naam, :voornaam=>@voornaam, :controle=>@controle
      end

    end
  end
end

