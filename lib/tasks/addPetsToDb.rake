
  task :refresh do
    #PetFinder API Endpoint
    species = "dog"
    url = "https://api.petfinder.com/v2/animals?type=#{species}"
    apiKey = 'iTZJADG54BT7Qw4yqXEA9MDyv9wggKeqjkmKvKZvCsCG1uJd2W'
    token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjVkMGE2Zjk4ODdlMzM0MGUzYzMwZTIyNDk2OGMwYjU0MjNmMDhiYzAzMDQ1ODY5ZjY4YzJiNWIxMmQ2ZmQ4ODFmZTQ1N2IyMmU0YmQxOWVhIn0.eyJhdWQiOiJpVFpKQURHNTRCVDdRdzR5cVhFQTlNRHl2OXdnZ0tlcWprbUt2S1p2Q3NDRzF1SmQyVyIsImp0aSI6IjVkMGE2Zjk4ODdlMzM0MGUzYzMwZTIyNDk2OGMwYjU0MjNmMDhiYzAzMDQ1ODY5ZjY4YzJiNWIxMmQ2ZmQ4ODFmZTQ1N2IyMmU0YmQxOWVhIiwiaWF0IjoxNTYyNzAxOTQzLCJuYmYiOjE1NjI3MDE5NDMsImV4cCI6MTU2MjcwNTU0Mywic3ViIjoiIiwic2NvcGVzIjpbXX0.WRwCiKHaiNb9yoO4faesJnZ32Oe6sgZIdMkOJiohRDnZFFHCMEAMteejEGFrlPp52BOuQGr4TxsQMLit_GWVnveDXinrcwH6RuoX_OpyGCkcmssBOvxdSkxJP3P1gyLO0VJzz83sm7TMENetjiOsxS-ZBoUxUhAmdrCOxgIkJqVSxCpXaEEYjNwFUsT0xQcWs-I7saXhfwELHROYpSBQyayZWpWsA9ahF5gjQkp09NdgvIEJv4yAp8hOO2A2NoPetAsj24eNRtzY9WusaNYKfl2Zw4pT76QMvMz_B-cRaLDG-_j6AxB5xP5gshAi7aKobjmO-Sar09feZIcy6wqPIA"
    data = JSON.parse(RestClient.get url, {:Authorization => "Bearer #{token}"})
    byebug
    data["animals"].each do |animal|
      Pet.find_or_create_by(name: animal["name"], small_photo_url: animal["photos"][0]["small"], medium_photo_url: animal["photos"][0]["medium"],
      gender: animal["gender"], description: animal["description"], breed_primary: animal["breed_primary"], species: animal["species"], age: animal["age"],
      status: animal["status"], email_address: animal["contact"]["email"], profile_url: animal["url"])
    end
  end
