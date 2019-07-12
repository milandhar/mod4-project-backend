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
    token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjllODIxNTA2NjQxNWIxYmQ1MjBmZjJhYzBhNjQ4YzMxMjE0M2IyN2YzYTJjNmQxOTY4MmU4MzU5ZDJiNzE4NDM3ZGM3ZmNjYzg0ZjI0NjRlIn0.eyJhdWQiOiJpVFpKQURHNTRCVDdRdzR5cVhFQTlNRHl2OXdnZ0tlcWprbUt2S1p2Q3NDRzF1SmQyVyIsImp0aSI6IjllODIxNTA2NjQxNWIxYmQ1MjBmZjJhYzBhNjQ4YzMxMjE0M2IyN2YzYTJjNmQxOTY4MmU4MzU5ZDJiNzE4NDM3ZGM3ZmNjYzg0ZjI0NjRlIiwiaWF0IjoxNTYyOTEyOTg5LCJuYmYiOjE1NjI5MTI5ODksImV4cCI6MTU2MjkxNjU4OSwic3ViIjoiIiwic2NvcGVzIjpbXX0.Aita-y43mjDdOHwq3oLVBBMR8xQpPTfrqE_7TO_C9d0jeH40oxiBWp0xuglY3G4J_JcrX7Fspms4hDUCCDcdMfVNeKTevYmeXB8faBlJBYOr1IioqZW99YCTE10ULdSbXkhSg5DRxoHRrafQioftxGX7wcygm1ClnHxwUzgsS9IEk_3j8XIhn-YMKhRdYmXpSWN4XWA5k8mrrk5sYS85FEKiQ2zX3NTuFKP98Ne0Nd9C-dBmZGk_rpe-byIj1NGyaDhNcGlzgTRdFxnfAR8oj93nWSZPno74XCGfdnefLaRtBZdX8qUVGlsIUjsrQ071ZtQvo3cIpEfHTBFDQ0jP5Q"
    data = JSON.parse(RestClient.get url, {
        :Authorization => "Bearer #{token}"
        #, :params => params
      })
  end
end
