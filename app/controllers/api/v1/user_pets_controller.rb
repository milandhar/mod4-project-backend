class Api::V1::UserPetsController < ApplicationController
  skip_before_action :authorized, only: [:create, :index]

  def index
    @user_pets = UserPet.all
    render json: @user_pets
  end

  def create
    @user_pet = UserPet.new(user_pet_params)
    if @user_pet.save
      render json: { user:   UserPetSerializer.new(@user_pet) }, status: :created
    else
      render json: {error: 'failed to create user pet relationship' }, status: :not_acceptable
    end
  end

  private

  def user_pet_params
    params.require(:user_pet).permit(:pet_id, :user_id)
  end

end
