class Pet < ApplicationRecord
  has_many :user_pets
  has_many :users, through: :user_pets


  def self.queryPetsDb
    species = "dog"
    url = "https://api.petfinder.com/v2/animals?type=#{species}"
    apiKey = 'iTZJADG54BT7Qw4yqXEA9MDyv9wggKeqjkmKvKZvCsCG1uJd2W'
    token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjZhMDZhZDVjYjdjNjgzM2VlZDI2ZGQxNzRlYzE1NDRkNjBkN2YwOWMwZThhZWE4OGVkN2VkMTU0NjgxNjc3OGFjYTEyMzNmNDIwZjIwZWM5In0.eyJhdWQiOiJpVFpKQURHNTRCVDdRdzR5cVhFQTlNRHl2OXdnZ0tlcWprbUt2S1p2Q3NDRzF1SmQyVyIsImp0aSI6IjZhMDZhZDVjYjdjNjgzM2VlZDI2ZGQxNzRlYzE1NDRkNjBkN2YwOWMwZThhZWE4OGVkN2VkMTU0NjgxNjc3OGFjYTEyMzNmNDIwZjIwZWM5IiwiaWF0IjoxNTYyODgzODkyLCJuYmYiOjE1NjI4ODM4OTIsImV4cCI6MTU2Mjg4NzQ5Miwic3ViIjoiIiwic2NvcGVzIjpbXX0.JZNIUnb01YQZbfnQBHF0o8hzLPdcaHbsTQ-210Sy1ZH_H3pweLqNRg_f20yo_GKsaBIdG5T0aja0NkBLVZ2yVmd-40XNkDdgY3LYYjT0CD2ggbp08AHvg2KiN-hoFpez79a8uoYQQv_biMN8U7j36KsbUYjIFWcqU8xFy874w_iS9uX__2mXnE-SFjYyl54nCsqXt6d_zFj7fdQDwLgMB9LIpcoh0XtcaACspck9PS7AW_N3-PsaCPbkg4M6PhQUZEhR7N31zroLyuqIVjhFwuR5Y7EAddUGXSn6n9MWj1R8mdf8PAfqPKfdVzrE7jWM7vhSSQC4iEPJ9XcobX9e1g"
    data = JSON.parse(RestClient.get url, {
        :Authorization => "Bearer #{token}",
        :params => {

        }
      })

  end
end
