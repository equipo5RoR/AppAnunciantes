class LastPayment 
  def self.get (advertiser_id)
   @lasts_payments = UserCommission.where("advertiser_id=? AND paid=1", advertiser_id)
   # Se introduce un condicional para que no obtenga fechas de operaciones vacias
   if @lasts_payments.size > 0
   # establecemos como fecha más baja la primera
     last_payment_date = @lasts_payments.first.date
   # recorremos todo el hash de ultimo_pago
     @lasts_payments.each{
       |payment|
   # si se encuentra una fecha más reciente se sustituye.
       last_payment_date = payment.date if payment.date > last_payment_date
     }
   else
      last_payment_date = nil
   end
      # devolvemos la fecha del ultimo pago
   return last_payment_date
  end 
end