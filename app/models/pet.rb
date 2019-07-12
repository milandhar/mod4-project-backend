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
    token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImIwNGJmZTk5Y2ZmMDY1ZGZiNDI0ZDQ4M2I0YmI2Zjg5YzQ0N2RmMGExNGViODY1Y2I1NzYyNTA5NTMzZjBjYjUwOTAzMzE2ZGIxOTAzZjRjIn0.eyJhdWQiOiJpVFpKQURHNTRCVDdRdzR5cVhFQTlNRHl2OXdnZ0tlcWprbUt2S1p2Q3NDRzF1SmQyVyIsImp0aSI6ImIwNGJmZTk5Y2ZmMDY1ZGZiNDI0ZDQ4M2I0YmI2Zjg5YzQ0N2RmMGExNGViODY1Y2I1NzYyNTA5NTMzZjBjYjUwOTAzMzE2ZGIxOTAzZjRjIiwiaWF0IjoxNTYyOTUzNzM0LCJuYmYiOjE1NjI5NTM3MzQsImV4cCI6MTU2Mjk1NzMzNCwic3ViIjoiIiwic2NvcGVzIjpbXX0.vQJGt-8F08hK144I_hwvNnzfDZItjcmJr6q_5Wi6Z-0t7M14QF0myBOWxEHHBRHd0SDvyK6YUg0K3Hy9umNwPJFEK2M-cyiMWtXn6aTKkNalhrEAuB-zse1Ln9yOns0NV3mStXwclMF_ItlYbCWFKSdEHhj5Ct29GazoTMfEpHZ5KjqcEPYm97hSQE34BLCk3AvyFIvjh4lcxPKJiESySZovMYEkb0LSuMPvrXPuBWZJZpeLmPu4PnbckITnMlQ8ksZR9H1-KHCER9FXSKE4wsYGCGA7tf8VGjK6qlF2pU_L6b8CpJBazcW8KX5A9CHWM2ZawklSwiUa36SAPweqDw"
    data = JSON.parse(RestClient.get url, {
        :Authorization => "Bearer #{token}"
        #, :params => params
      })
  end
end
