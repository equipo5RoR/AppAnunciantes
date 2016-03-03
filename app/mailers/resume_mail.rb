class ResumeMail < ApplicationMailer  
  # definimos un método que envie el mensaje con el archivo adjunto.
  def resume_email(email,csv)
    attachments["resumen.csv"] = csv #comando para adjuntar archivo.
    mail :to => email, :from => "pruebasmailror@gmail.com", :subject=> 'Resumen de las puntuaciones'
  end
  
end

# para terminar de configurar el envío de mail a través de google:
# meterse en las preferencias de cuenta de la cuenta origen del correo.
# Mi Cuenta/ Inicio de sesión y seguridad/Aplicaciones y sitios conectados
# Una vez en esta vista marcar la opción de 'Permitir el acceso de aplicaciones menos seguras' a SI.

# Para evitar problemas de spam en el correo al que se envía:
# mandar el correo desde una cuenta a sí misma