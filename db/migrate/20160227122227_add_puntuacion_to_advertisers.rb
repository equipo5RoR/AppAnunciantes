class AddPuntuacionToAdvertisers < ActiveRecord::Migration
  def change
    add_column :advertisers, :puntuacion, :integer
  end
end
