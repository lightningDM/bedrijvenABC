require 'test_helper'

class PaymentControllerTest < ActionController::TestCase
   setup do
    @company = companies(:one)
  end
  test "should get index" do
    get :new
    assert_response :success
  end

  test "should not create Payment" do
     session[:company]=@company
     post :create, {:nummer=>'41111111',:maand=>12,:jaar=>2010,  :voornaam=>'matthias',:naam=>'druwe',:controle=>123}
 
     assert_redirected_to payment_url+"?nummer=41111111&jaar=2010&maand=12&naam=druwe&voornaam=matthias&controle=123"

  end
   test "should create Payment" do
      session[:company]=@company

       post :create,{ :nummer=>'4111111111111111',:maand=>12,:jaar=>2012,  :voornaam=>'matthias',:naam=>'druwe',:controle=>123}

     assert_redirected_to company_path(@company)

  end

end
