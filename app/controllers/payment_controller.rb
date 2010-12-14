class PaymentController < ApplicationController

  def new
  end

  def create
    ActiveMerchant::Billing::Base.mode= :test


    credit_card                       =ActiveMerchant::Billing::CreditCard.new(
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
      gateway=ActiveMerchant::Billing::TrustCommerceGateway.new(
          :login=>"TestMerchant",
          :password=>"password"
          )
      response =gateway.purchase(1000,credit_card)

      if response.success?

        else
        (redirect_to companies_url, :notice => 'Company was successfully created.')
      end


    else
      (redirect_to companies_url, :notice => 'Company was successfully created.')
    end
  end

end
