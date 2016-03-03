require 'test_helper'

class CalculatePuntuationTest < ActiveSupport::TestCase
   test "calculate_puntuation OK" do
   accepts_claims = true 
   last_cashback = nil
   last_payment = nil
   claims_percent = 4
   accepted_claims_percent = 82
   puntuation = CalculatePuntuation.calculate(last_cashback, last_payment, accepts_claims, claims_percent, accepted_claims_percent)
   
   assert_equal(6,puntuation)
 end
end
