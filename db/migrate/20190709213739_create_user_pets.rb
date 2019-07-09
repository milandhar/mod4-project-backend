class CreateUserPets < ActiveRecord::Migration[5.2]
  def change
    create_table :user_pets do |t|
      t.belongs_to :pet
      t.belongs_to :user

      t.timestamps
    end
  end
end
