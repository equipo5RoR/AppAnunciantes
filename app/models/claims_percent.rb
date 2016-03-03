class ClaimsPercent  
  def self.get (advertiser_id)
    # variables para el conteo de las reclamaciones, tanto totales como aceptadas.    
    total_claims = UserClaim.where("advertiser_id=?",advertiser_id).count
    # variable para el conteo de las ventas(comisiones) de una tienda.
    total_sales = UserCommission.where("advertiser_id=?",advertiser_id).count  
    # calculamos el porcentaje de reclamaciones sobre el total de ventas de cada anunciante
    total_sales > 0 ? claims_percent = (total_claims.to_f / total_sales.to_f * 100) : claims_percent = 0
  end
end