class UpdatePuntuation
    def self.get
    Advertiser.all.each {
      |advertiser|
        params_update = Hash.new
        params_update[:last_cashback] = LastCashback.get advertiser.id
        params_update[:last_payment] = LastPayment.get advertiser.id
        params_update[:accepts_claims] = AcceptsClaims.get advertiser
        params_update[:claims_percent] = ClaimsPercent.get advertiser.id
        params_update[:accepted_claims_percent] = AcceptedClaimsPercent.get advertiser.id
        # llamamos al método para calcular la puntuación
        puntuation = CalculatePuntuation.calculate params_update
        # finalmente almacenamos la puntuacion calculada en la tabla de la bbdd y guardamos.    
        advertiser.puntuacion = puntuation
        advertiser.save
    }   
    end
end