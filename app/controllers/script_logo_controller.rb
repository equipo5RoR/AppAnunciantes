class ScriptLogoController < ApplicationController
  def show
    if @advertiser = Advertiser.find_by_id(params[:id])
      response.content_type = 'image/svg+xml'
      render :text =>  ScriptLogo.new(name: @advertiser.name, seed: @advertiser.id).generate
    end
  end
end