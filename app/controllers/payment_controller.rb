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

      ActiveMerchant::Billing::PaypalGateway.default_currency ="USD"
      gateway                                                 =ActiveMerchant::Billing::PaypalGateway.new(
          :login    =>"matthi_1293177185_biz_api1.howest.be",
          :password =>"1293177202",
          :signature=>"An5ns1Kso7MWUdW4ErQKJJJ4qi4-ACEzKYd94x2Kmq9RoYH40Oxt-cLe"
      )

      authorize_response                                      =gateway.authorize(1000, "4866292328174444",:payer_id=>"matthi_1293177091_per@howest.be", :token=>"bedrijvenabc", :ip=> "127.0.0.0")
      # gateway.purchase(1000,receiver,:subject=>"payment",:note=>"just paying")
      if authorize_response.success?

# period can be Day, Week, Month, Year, etc...

        profile_response = gateway.create_profile(params[:token],
                                                  :description           => "DESCRIPTION_TEXT",
                                                  :start_date            => Date.today,
                                                  :period                => 'Month',
                                                  :frequency             => 1,
                                                  :amount                => 1000,
                                                  :auto_bill_outstanding => true)

        if profile_response.success?
# capture the payment
          gateway.capture(money, authorize_response.authorization)
# save paypal_profile_id to edit the subscription later
# The profile_id is stored in: profile_response.params["profile_id"
        else
# void the transaction
          gateway.void(authorize_response.authorization)
        end
        end


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

