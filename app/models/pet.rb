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
    token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImY1OGZjNTA1OTM4NTZiN2RmMjc3NjAxN2RmOGNmMWJiMDhkYjk0NWY0NjEzMDRjZDcyYzkzNDgzZDM0NGQwMjMyZDNkZjE0N2QwYTNhOTY4In0.eyJhdWQiOiJpVFpKQURHNTRCVDdRdzR5cVhFQTlNRHl2OXdnZ0tlcWprbUt2S1p2Q3NDRzF1SmQyVyIsImp0aSI6ImY1OGZjNTA1OTM4NTZiN2RmMjc3NjAxN2RmOGNmMWJiMDhkYjk0NWY0NjEzMDRjZDcyYzkzNDgzZDM0NGQwMjMyZDNkZjE0N2QwYTNhOTY4IiwiaWF0IjoxNTYyOTU4ODM0LCJuYmYiOjE1NjI5NTg4MzQsImV4cCI6MTU2Mjk2MjQzNCwic3ViIjoiIiwic2NvcGVzIjpbXX0.ALjh799ViYyIJjYrQDhc7zy-4mq_wMBLtpZb97oDg8tHe8D0La6Kj0oi8bCUhX0xec6eZf-buO6lfzTeM-zNWKv_aVYexaK_yr8iI5gXxaJCsmAd738zJuN5A2FxpOwxuejERNPS4TgdRaEmh7DNEFJl0Jmay4DLvSIElhYwn4BCJ21VgG599_P2gWVd9-MQuRlnORUb7G28MfE_Rm5Xyq5tpuidckZYQKQjDvm9f7rmNIJ4N2AfXidQ8qePmxOcxVZnCynuHglVp4S7NBlKkYMzM2co4zN5xbV8Ppf5axNaQ3qYQkVl8kKc09-whVrUkFfeO5Kfz9WMwx1A4zy6Yg"
    data = JSON.parse(RestClient.get url, {
        :Authorization => "Bearer #{token}"
        #, :params => params
      })
  end
end
