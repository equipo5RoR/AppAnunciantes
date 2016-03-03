class AcceptedClaimsPercent 
  def self.get (advertiser_id)
    # variables para el conteo de las reclamaciones, tanto totales como aceptadas.    
    accepted_claims = UserClaim.where("advertiser_id=? AND user_commission_id IS NOT NULL", advertiser_id).count
    total_claims = UserClaim.where("advertiser_id=?",advertiser_id).count
    total_claims > 0 ? accepted_claims_percent = (accepted_claims.to_f / total_claims.to_f * 100) : accepted_claims_percent = 0
    # calculamos el porcentaje de reclamaciones aceptadas sobre el total de reclamaciones de cada anunciante
    # Se introduce un condicional para evitar division entre 0
    # devolvemos el porcentaje de reclamaciones aceptadas sobre el total
    # return accepted_claims_percent   
  end
end

