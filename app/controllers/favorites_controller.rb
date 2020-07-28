class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(hospital_id: params[:hospital_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @hospital = Hospital.find(params[:hospital_id])
    @favorite = current_user.favorites.find_by(hospital_id: @hospital.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
