# app/controllers/shelters_controller.rb

class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def pets
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.create(shelter_params[:shelter])
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update(shelter_params[:shelter])
    redirect_to "/shelters/#{shelter.id}"
  end

  def delete
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  private

    def shelter_params
      params.permit( :shelter => [:name, :address, :city, :state, :zip])
    end


end