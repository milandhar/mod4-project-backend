class Pet < ApplicationRecord
  has_many :user_pets
  has_many :users, through: :user_pets


  def self.queryPetsDb
    species = "bird"
    url = "https://api.petfinder.com/v2/animals?type=#{species}"
    apiKey = 'iTZJADG54BT7Qw4yqXEA9MDyv9wggKeqjkmKvKZvCsCG1uJd2W'
    token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjM0ODk1MzQ0OTg3N2ZjNTFlNTRkM2I2MzQ3MWQxY2UwZjlkNTk1Y2I0NGEwYmY5ZjcxMzUxY2EzMDU3MDExY2JiMmZkZTVjOWY4ZWMwMDNhIn0.eyJhdWQiOiJpVFpKQURHNTRCVDdRdzR5cVhFQTlNRHl2OXdnZ0tlcWprbUt2S1p2Q3NDRzF1SmQyVyIsImp0aSI6IjM0ODk1MzQ0OTg3N2ZjNTFlNTRkM2I2MzQ3MWQxY2UwZjlkNTk1Y2I0NGEwYmY5ZjcxMzUxY2EzMDU3MDExY2JiMmZkZTVjOWY4ZWMwMDNhIiwiaWF0IjoxNTYyNzk0MjYxLCJuYmYiOjE1NjI3OTQyNjEsImV4cCI6MTU2Mjc5Nzg2MSwic3ViIjoiIiwic2NvcGVzIjpbXX0.TpXvCnkSIkJAuwVFoQzUVH4vk9qYYrzmJ4Wty6BtkPI8Qj47DUW-IuxCKGeLgsl2WjBdC80HoWCaFjeUPY6QIKl6K1eHwYZxyH8QjSd5V5KRJC30f-e3tN9RbDxY0_6Ntdl_R8dDiwo5CV-a0Dx-ImdXd63ddOCYPG4ixuxS9s_li0XcksgISmrvoQDt2G4Vb100kXThAg0SmsDyoUpCrfiJgElcQ56SbBJvMZuVmfYbWCVExHbCS-NMzTrOZkLtk5S7naZajPskN1LMLj2Y_qYmQvB-9AZ6JjbD7Y4kxj-CuLXoMQxiVq1Cjfa8Y549LNTePPljjLfa3sfg9Bpomg"
    data = JSON.parse(RestClient.get url, {
        :Authorization => "Bearer #{token}",
        :params => {

        }
      })

  end
end
