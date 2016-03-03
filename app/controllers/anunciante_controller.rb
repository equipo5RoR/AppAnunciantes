class AnuncianteController < ApplicationController

  def index
    # Se define la variable de clase con la llamada al método de paginacion
    @advertisers = Advertiser.all.order("puntuacion DESC").paginate(:page => params[:page], :per_page => 10)
  end
  
  
  def detalle
    @advertiser = Advertiser.find_by_id(params[:id])
  end

end