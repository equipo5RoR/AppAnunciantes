class SendMail  
    def self.get
    # creamos una variable que almacene la conversion de la tabla a csv
    csv = Advertiser.to_csv
    # Definimos el email al que se va a enviar el resumen y llamamos al método de la clase mailer.
    email = 'pruebasmailror@gmail.com'
    ResumeMail.resume_email(email,csv).deliver_now
  end
end