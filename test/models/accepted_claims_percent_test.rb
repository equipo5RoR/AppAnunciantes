require 'test_helper'

class AcceptedClaimsPercentTest < ActiveSupport::TestCase
 test "Porcentaje de reclamaciones OK" do
   
   advertiser = Advertiser.create!(name: 'fnac')
   uc = UserCommission.create!(id: 1)

   221.times{ advertiser.user_claims.create!(user_commission_id: uc.id)}
   44.times{ advertiser.user_claims.create!()}

   fnac = AcceptedClaimsPercent.get advertiser.id
   a = (221.0/265.0) * 100
   assert_equal(a,fnac)
 end
end
