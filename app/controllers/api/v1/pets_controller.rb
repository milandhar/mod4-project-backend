class Api::V1::PetsController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def index
    @pets = []
    if params["gender"]
      @pets << Pet.where("gender" => params["gender"])
    elsif params["age"]
      @pets << Pet.where("age" => params["age"])
    else
      @pets << Pet.all
    end

    render json: @pets[0]
  end

  def create
    @pets = []
    data = Pet.queryPetsDb

    if data && data["animals"]
      data["animals"].each do |animal|
        if (animal["name"] &&
                animal["photos"] &&
                animal["photos"][0] &&
                animal["photos"][0]["small"] &&
                animal["photos"][0]["medium"] &&
                animal["gender"] &&
                animal["description"] &&
                animal["breeds"] &&
                animal["breeds"]["primary"] &&
                animal["species"] &&
                animal["age"] &&
                animal["status"] &&
                animal["contact"] &&
                animal["contact"]["email"] &&
                animal["url"])
          # @pet = Pet.find_or_create_by(name: animal["name"], small_photo_url: animal["photos"][0]["small"], medium_photo_url: animal["photos"][0]["medium"], gender: animal["gender"], description: animal["description"], breed_primary: animal["breeds"]["primary"], species: animal["species"], age: animal["age"], status: animal["status"], email_address: animal["contact"]["email"], profile_url: animal["url"])
          if(Pet.find_by({
                  name: animal["name"],
                  small_photo_url: animal["photos"][0]["small"],
                  medium_photo_url: animal["photos"][0]["medium"],
                  gender: animal["gender"],
                  description: animal["description"],
                  breed_primary: animal["breeds"]["primary"],
                  species: animal["species"],
                  age: animal["age"],
                  status: animal["status"],
                  email_address: animal["contact"]["email"],
                  profile_url: animal["url"]}))
            @pet = Pet.find_by(name: animal["name"], small_photo_url: animal["photos"][0]["small"], medium_photo_url: animal["photos"][0]["medium"], gender: animal["gender"], description: animal["description"], breed_primary: animal["breeds"]["primary"], species: animal["species"], age: animal["age"], status: animal["status"], email_address: animal["contact"]["email"], profile_url: animal["url"])
          elsif(Pet.new(name: animal["name"], small_photo_url: animal["photos"][0]["small"], medium_photo_url: animal["photos"][0]["medium"], gender: animal["gender"], description: animal["description"], breed_primary: animal["breeds"]["primary"], species: animal["species"], age: animal["age"], status: animal["status"], email_address: animal["contact"]["email"], profile_url: animal["url"]))
            @pet = Pet.new(name: animal["name"], small_photo_url: animal["photos"][0]["small"], medium_photo_url: animal["photos"][0]["medium"], gender: animal["gender"], description: animal["description"], breed_primary: animal["breeds"]["primary"], species: animal["species"], age: animal["age"], status: animal["status"], email_address: animal["contact"]["email"], profile_url: animal["url"])
            @pet.save
          else
            @pet = {}
          end
          if @pet.valid?
            @pets.push(@pet)
          end
        end
      end
    end
    render json: @pets
  end


  private

  def pet_params

  end

end
