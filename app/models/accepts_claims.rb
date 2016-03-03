class AcceptsClaims
  def self.get (advertiser)
    return true  if advertiser.accepts_claims == 1
  end
end