class UserClaim < ActiveRecord::Base
  
  belongs_to :advertiser
  belongs_to :user_commission
  
end
