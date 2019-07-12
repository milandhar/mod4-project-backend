class Api::V1::PetsController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def index
    @pets = []

    if params["gender"] && params["age"]
      @pets.push(Pet.where("gender" => params["gender"], "age" => params["age"])).flatten!
    else
      if params["gender"]
        @pets.push(Pet.where("gender" => params["gender"])).flatten!
      elsif params["age"]
        @pets.push(Pet.where("age" => params["age"])).flatten!
      else
        @pets.push(Pet.all).flatten!
      end
    end

    render json: @pets
  end

  def create
    @pets = []
    data = Pet.queryPetsDb({age: params["age"], gender: params["gender"]})

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
