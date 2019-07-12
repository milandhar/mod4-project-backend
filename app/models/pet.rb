class Pet < ApplicationRecord
  has_many :user_pets
  has_many :users, through: :user_pets


  def self.queryPetsDb
    species = "dog"
    url = "https://api.petfinder.com/v2/animals?type=#{species}"
    apiKey = 'iTZJADG54BT7Qw4yqXEA9MDyv9wggKeqjkmKvKZvCsCG1uJd2W'
    token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjQyY2YyMTMwNjk2MTRiNDhiYWJlMjQ4Mjk3ZjQzNWY0YTg0YzZhMmNiMzk0NGEzOWU4YzAyY2Q2YjNmOThlNjk5ZGJmOWM3YmZlNDQ4NGY3In0.eyJhdWQiOiJpVFpKQURHNTRCVDdRdzR5cVhFQTlNRHl2OXdnZ0tlcWprbUt2S1p2Q3NDRzF1SmQyVyIsImp0aSI6IjQyY2YyMTMwNjk2MTRiNDhiYWJlMjQ4Mjk3ZjQzNWY0YTg0YzZhMmNiMzk0NGEzOWU4YzAyY2Q2YjNmOThlNjk5ZGJmOWM3YmZlNDQ4NGY3IiwiaWF0IjoxNTYyODkxODI0LCJuYmYiOjE1NjI4OTE4MjQsImV4cCI6MTU2Mjg5NTQyNCwic3ViIjoiIiwic2NvcGVzIjpbXX0.ikRUkDDZhc_bU56KFlx9KqMD9Gd81-tZWRHf3TES8jNmVejUvMfjdlzCFKWbZTIiiuVmC_HYmWRLUeiu-vIjgfAG_2Qocn10G_z0-XcryQHUxm3pttL4fBTUkMxPWtXb8XnDyPYJ9zfa3UZ504AfBVBXh2hdUY7NdD2Vh2SvR2ezCBqFJTXnp4YhwZQ84SKeQ5O_bxXHpKmvoFgT3Mrl18vAIEK0ZMFhC7liwfLZsFp83eqqEx9MuQymyI_bKWn3UguDofmR-fQcoW1iXLaiqv7YQVIZokC8vey0SUA8SVs47N4xxLJTMj2NeFueBu1_Pcj2rjR0PoP5qmLbV6R2Fg"
    data = JSON.parse(RestClient.get url, {
        :Authorization => "Bearer #{token}",
        :params => {

        }
      })

  end
end
