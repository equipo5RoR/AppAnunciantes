class Advertiser < ActiveRecord::Base
  
  has_many :user_claims, :dependent => :nullify
  has_many :user_commissions, :dependent => :nullify
  
  # definimos un método para la conversión de la tabla a un archivo csv.
  # se le añaden los atributos 'col_sep' y 'row_sep' que son los separadores de columna y fila.
  # se añade el require en el application.rb
  def self.to_csv
    csv_string = CSV.generate(:col_sep => "\t", :row_sep => "\r\n") do |csv|
      advertisers = all
      csv << ["id", "name", "puntuacion"]
      for advertiser in advertisers
        csv << [advertiser.id, advertiser.name, advertiser.puntuacion]
      end
    end
  end
  
end
