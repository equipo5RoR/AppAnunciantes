class CalculatePuntuation
  def self.calculate (params_update)
    # definimos el día actual y las fechas necesarias para la puntuacion
    date = Time.now.to_date
    date_before_48h = date - 2
    date_before_10_days = date - 10
    date_before_60_days = date - 60
    date_before_100_days = date - 100
    puntuation = 0
    # CASO 1. Calculamos la puntuación por ultimo reembolso en función de los criterios de puntuacion
    if params_update[:last_cashback] != nil #Nos de no hacer el calculo con last_cashback nil
      puntuation +=2 if (params_update[:last_cashback] > date_before_48h)        
      puntuation +=1 if (params_update[:last_cashback] > date_before_10_days)   
    end    
    # CASO 2. Calculamos la puntuación por ultimo reembolso en función de los criterios de puntuacion
    if params_update[:last_payment] != nil #Nos de no hacer el calculo con last_payment nil
     puntuation +=2 if (params_update[:last_payment]  > date_before_60_days)  
     puntuation +=1 if (params_update[:last_payment]  >  date_before_100_days)         
    end
    # CASO 3. Calculamos la puntuacion en funcion de si admite reclamaciones
    puntuation +=2 if params_update[:accepts_claims] == true
    # CASO 4. Calculamos la puntuacion en funcion de las reclamaciones sobre el total de ventas.
    puntuation +=2 if (params_update[:claims_percent] <= 5)
    puntuation +=1 if (params_update[:claims_percent] > 5 && params_update[:claims_percent] < 20)
    # CASO 5. calculamos la puntuacion en funcion de las reclamaciones aceptadas sobre las reclamaciones totales    
    puntuation +=2 if (params_update[:accepted_claims_percent] >= 80)  
    puntuation +=1 if (params_update[:accepted_claims_percent] > 50 && params_update[:accepted_claims_percent] < 80)
    # devolvemos la puntuacion
  end  
end