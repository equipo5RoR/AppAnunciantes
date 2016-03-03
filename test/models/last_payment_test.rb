require 'test_helper'

class LastPaymentTest < ActiveSupport::TestCase
  test "last payment OK" do
   advertiser = Advertiser.create!(name: 'fnac')
   date1 = '2016-02-02'
   date2 = '2016-02-03'
   date3 = '2016-02-04'
   1.times{ advertiser.user_commissions.create!(advertiser_id:1, date: date1, paid: 1)}
   1.times{ advertiser.user_commissions.create!(advertiser_id:1, date: date2, paid: 1)}
   1.times{ advertiser.user_commissions.create!(advertiser_id:1, date: date3, paid: 1)}
   fnac = LastPayment.get advertiser.id
   assert_equal(date3,fnac.to_s)
 end
end
