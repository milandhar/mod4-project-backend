class Api::V1::PetsController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def index
    @pets = Pet.all
    render json: @pets
  end

  def create
    @pets = []
    data = Pet.queryPetsDb
    if data!=nil
      data["animals"].each do |animal|
        @pet = Pet.find_or_create_by(name: animal["name"], small_photo_url: animal["photos"][0]["small"], medium_photo_url: animal["photos"][0]["medium"],
        gender: animal["gender"], description: animal["description"], breed_primary: animal["breeds"]["primary"], species: animal["species"], age: animal["age"],
        status: animal["status"], email_address: animal["contact"]["email"], profile_url: animal["url"])
        if @pet.valid?
          @pets.push(@pet)
        end
      end
    end
    render json: @pets
  end



  private

  def pet_params

  end

end
