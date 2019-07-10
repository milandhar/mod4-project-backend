class Api::V1::PetsController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def index
    @pets = Pet.all
    render json: @pets
  end

  def create
    data = Pet.queryPetsDb
    data["animals"].each do |animal|
      @pet = Pet.find_or_create_by(name: animal["name"], small_photo_url: animal["photos"][0]["small"], medium_photo_url: animal["photos"][0]["medium"],
      gender: animal["gender"], description: animal["description"], breed_primary: animal["breeds"]["primary"], species: animal["species"], age: animal["age"],
      status: animal["status"], email_address: animal["contact"]["email"], profile_url: animal["url"])
      byebug
      if @pet.valid?
        render json: { pet:   PetSerializer.new(@pet) }, status: :created
      else
        render json: {error: 'failed to create pet' }, status: :not_acceptable
      end
    end
  end



  private

  def pet_params

  end

end
