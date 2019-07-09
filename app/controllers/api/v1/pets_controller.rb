class Api::V1::PetsController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def index
    @pet = Pet.all
    render json: @pet
  end
end
