class PaymentController < ApplicationController

  def new
  end

  def create


    @error=''
    if (params[:nummer] =='')
      @error +='enter a number <br/>'
      @nummer=''
    else
      @nummer=params[:nummer]
    end
    if (params[:maand] =='')
      @error+='enter a month<br/>'
      @maand=''
    else
      @maand=params[:maand]
    end
    if (params[:jaar] =='')
      @error+='enter a year<br/>'
      @jaar =''
    else
      @jaar=params[:jaar]
    end
    if (params[:voornaam] =='')
      @error   +='enter a firstname<br/>'
      @voornaam=''
    else
      @voornaam=params[:voornaam]
    end
    if (params[:naam] =='')
      @error+='enter a name<br/>'
      @naam =''
    else
      @naam=params[:naam]
    end
    if (params[:controle] =='')
      @error   +='enter a controlevalue<br/>'
      @controle=''

    else
      @controle=params[:controle]
    end

    if @error==''
      ActiveMerchant::Billing::Base.mode                      = :test

        credit_card =ActiveMerchant::Billing::CreditCard.new(
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
            @company=session[:company]
            respond_to do |format|
              if @company.save
                format.html { redirect_to(@company, :notice => 'Company was successfully created.') }
                format.xml { render :xml => @company, :status => :created, :location => @company }
                session.clear
              else
                format.html { render :action => "new" }
                format.xml { render :xml => @company.errors, :status => :unprocessable_entity }
              end
            end
          else
            flash[:notice]='invalid data'
            (redirect_to payment_url :nummer=>@nummer, :jaar=>@jaar, :maand=>@maand, :naam=>@naam, :voornaam=>@voornaam, :controle=>@controle)
          end


        else
          flash[:notice]='invalid data'
          (redirect_to payment_url :nummer=>@nummer, :jaar=>@jaar, :maand=>@maand, :naam=>@naam, :voornaam=>@voornaam, :controle=>@controle)
        end
      else
        flash[:notice] = @error
        redirect_to payment_url :nummer=>@nummer, :jaar=>@jaar, :maand=>@maand, :naam=>@naam, :voornaam=>@voornaam, :controle=>@controle
      end

    end
  end

