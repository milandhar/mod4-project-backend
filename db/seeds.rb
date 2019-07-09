# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Pet.delete_all

species = "dog"
url = "https://api.petfinder.com/v2/animals?type=#{species}"
apiKey = 'iTZJADG54BT7Qw4yqXEA9MDyv9wggKeqjkmKvKZvCsCG1uJd2W'
token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImY0N2E2ZjhlNGVjNmQ5M2FiMTc4OTliOTRiMGQzZWM0YWM5MTFiOTY0NTIzZjM3Y2U5ZWY2YWFiZDYxNTkyMmRmMDkxYTAxOWFhNjVhOGM0In0.eyJhdWQiOiJpVFpKQURHNTRCVDdRdzR5cVhFQTlNRHl2OXdnZ0tlcWprbUt2S1p2Q3NDRzF1SmQyVyIsImp0aSI6ImY0N2E2ZjhlNGVjNmQ5M2FiMTc4OTliOTRiMGQzZWM0YWM5MTFiOTY0NTIzZjM3Y2U5ZWY2YWFiZDYxNTkyMmRmMDkxYTAxOWFhNjVhOGM0IiwiaWF0IjoxNTYyNzA1ODgxLCJuYmYiOjE1NjI3MDU4ODEsImV4cCI6MTU2MjcwOTQ4MSwic3ViIjoiIiwic2NvcGVzIjpbXX0.daseN0qh2Wivt9JFKwjfYz6_Y1Vnpw_6YTJVX_q9tOyzvCQCMx9uYvVDLHUJ27HosgYM8gv6OAP-G8j6M-Gllzh0tNmz7B21EobPO9bVjbzEK2N7xNISsWhU9BJI3jxxTs2j6O1qJpFokNjGoO0mrT_d0ZA2Dlgow5rfjbgu1LwtpBOb3ASJ9vAoRCUQUcr75CsukS_kyS07q597SRZvC4QOKOKu-FpB42pLzMYb4cbfu28kbnoJEVHHaL3bn2R_o7qjOd4zB4dYbO6leo_-pEU_e5-qj5dnutk9WGDOYlmTUxOpCQ1wgDLvboBnZDK7wZRQu8dp594dEm5sTNKPgw"
data = JSON.parse(RestClient.get url, {:Authorization => "Bearer #{token}"})

data["animals"].each do |animal|
  Pet.find_or_create_by(name: animal["name"], small_photo_url: animal["photos"][0]["small"], medium_photo_url: animal["photos"][0]["medium"],
  gender: animal["gender"], description: animal["description"], breed_primary: animal["breeds"]["primary"], species: animal["species"], age: animal["age"],
  status: animal["status"], email_address: animal["contact"]["email"], profile_url: animal["url"])
end
