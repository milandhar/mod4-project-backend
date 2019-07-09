class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :small_photo_url
      t.string :medium_photo_url
      t.string :gender
      t.text :descrption
      t.string :breed_primary
      t.string :species
      t.string :age
      t.string :status
      t.string :email_address
      t.string :profile_url

      t.timestamps
    end
  end
end
