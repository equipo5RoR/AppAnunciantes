require 'test_helper'

class LastCashbackTest < ActiveSupport::TestCase
 test "last cashback OK" do
   advertiser = Advertiser.create!(name: 'fnac')
   date1 = '2016-02-02'
   date2 = '2016-02-03'
   date3 = '2016-02-04'
   1.times{ advertiser.user_commissions.create!(advertiser_id:1, date: date1)}
   1.times{ advertiser.user_commissions.create!(advertiser_id:1, date: date2)}
   1.times{ advertiser.user_commissions.create!(advertiser_id:1, date: date3)}
   fnac = LastCashback.get advertiser.id
   assert_equal(date3,fnac.to_s)
 end
end
