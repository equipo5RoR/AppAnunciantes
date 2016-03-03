class LastCashback 
  def self.get (advertiser_id)
    @lasts_cashbacks = UserCommission.where("advertiser_id=?", advertiser_id)
    # Se introduce un condicional para que no obtenga fechas de operaciones vacias
    if @lasts_cashbacks.size > 0
      # establecemos como fecha más baja la primera
      last_cashback_date = @lasts_cashbacks.first.date
      # recorremos todo el hash de ultimo_reembolso
     @lasts_cashbacks.each{
       |cashback|
        # si se encuentra una fecha más reciente se sustituye.
       last_cashback_date = cashback.date if cashback.date > last_cashback_date
     }
    else
      last_cashback_date = nil
    end    
    return last_cashback_date   
  end
end