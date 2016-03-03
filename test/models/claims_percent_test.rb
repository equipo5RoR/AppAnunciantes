require 'test_helper'

class ClaimsPercentTest < ActiveSupport::TestCase
 test "Porcentaje de reclamaciones sobre compras OK" do
   advertiser = Advertiser.create!(name: 'fnac')
   uc = UserCommission.create!(id: 1)
   50.times{ advertiser.user_commissions.create!()}
   5.times{ advertiser.user_claims.create!(user_commission_id: uc.id)}
   fnac = ClaimsPercent.get advertiser.id
   assert_equal(10,fnac)
 end
end
