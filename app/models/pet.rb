class Pet < ApplicationRecord
  has_many :user_pets
  has_many :users, through: :user_pets


  def self.queryPetsDb(params)
    #JS XMLHTTP Method
    # let data = {
    #   "grant_type":"client_credentials",
    #   "client_id": "iTZJADG54BT7Qw4yqXEA9MDyv9wggKeqjkmKvKZvCsCG1uJd2W",
    #   "client_secret": "R7O4DJhZYYH1hbZhoUWIwOc70hF3vSN18x1U4N3z"
    # }
    #
    # let getToken= new XMLHttpRequest();
    # getToken.open("POST", "https://api.petfinder.com/v2/oauth2/token", true)
    # getToken.setRequestHeader('Content-Type', 'application/json');
    # getToken.send(JSON.stringify(data))
    gender_param = params[:gender]
    age_param = params[:age]
    species = "dog"
    limit = 50
    url = "https://api.petfinder.com/v2/animals?type=#{species}&limit=#{limit}"
      if gender_param != ""
        url = "#{url}&gender=#{gender_param}"
      elsif age_param != ""
        url = "#{url}&age=#{age_param}"
      end
    apiKey = 'iTZJADG54BT7Qw4yqXEA9MDyv9wggKeqjkmKvKZvCsCG1uJd2W'
    token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijk1YzAzNWRiNWM1MDBlNGU3MTkyMzZlNDU2OTcyZjNmZDgyMzdmNWYxMGYxM2Y0NjBmNTkyYTkxMTAzMDQ5ODI1NGIwNGJjMmFiMGQwODFhIn0.eyJhdWQiOiJpVFpKQURHNTRCVDdRdzR5cVhFQTlNRHl2OXdnZ0tlcWprbUt2S1p2Q3NDRzF1SmQyVyIsImp0aSI6Ijk1YzAzNWRiNWM1MDBlNGU3MTkyMzZlNDU2OTcyZjNmZDgyMzdmNWYxMGYxM2Y0NjBmNTkyYTkxMTAzMDQ5ODI1NGIwNGJjMmFiMGQwODFhIiwiaWF0IjoxNTYyOTUwMDc3LCJuYmYiOjE1NjI5NTAwNzcsImV4cCI6MTU2Mjk1MzY3Nywic3ViIjoiIiwic2NvcGVzIjpbXX0.ovRXaq5v75G3xCV3C-ttjc1oMfcrShnHMnQI9JmX5yigRptr9pyUPoILviRwU7SfitGmasyKYqALFqNLo6mkScIlLV2S8D_VsQqGjLUom8TI8lEAOLyQWUaRvtjtGIVXX1gKaSLh2adaO7isKaZPArMG57FR6lHNTbHaZ4aaHZgtzX4_rwMjZIlNHJsg4zHbRdnvCWz7iKix0PjKtNFbjINIpfgjNgqPkUszeKe2_dv5NwTiZgNcgSRS0jYeWmrZig0IkDxlWnnfsk1buQDGL2ETiJdmfy8wAh2aRRpJRhMSSrfsS3KvU_EPqO-3zDMm3D2zUttN_Kma1pRjhsT8gw"
    data = JSON.parse(RestClient.get url, {
        :Authorization => "Bearer #{token}"
        #, :params => params
      })
  end
end
