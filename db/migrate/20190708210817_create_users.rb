class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :img_path
      t.integer :zipcode
      t.string :email_address
      t.text :message_template

      t.timestamps
    end
  end
end
