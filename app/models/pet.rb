class Pet < ApplicationRecord
  has_many :user_pets
  has_many :users, through: :user_pets


  def self.queryPetsDb
    species = "dog"
    url = "https://api.petfinder.com/v2/animals?type=#{species}"
    apiKey = 'iTZJADG54BT7Qw4yqXEA9MDyv9wggKeqjkmKvKZvCsCG1uJd2W'
    token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImMwZGQyNDlkNzA4MWZjNjdjM2MxOGVhM2VjYmFiOWNkZTFiMWUyOTIxMDA5MWIyYTA4YzRiNDMyOWJhZWJiODNkNmRjOGE4YzEyYjAwODg4In0.eyJhdWQiOiJpVFpKQURHNTRCVDdRdzR5cVhFQTlNRHl2OXdnZ0tlcWprbUt2S1p2Q3NDRzF1SmQyVyIsImp0aSI6ImMwZGQyNDlkNzA4MWZjNjdjM2MxOGVhM2VjYmFiOWNkZTFiMWUyOTIxMDA5MWIyYTA4YzRiNDMyOWJhZWJiODNkNmRjOGE4YzEyYjAwODg4IiwiaWF0IjoxNTYyNzk3ODY4LCJuYmYiOjE1NjI3OTc4NjgsImV4cCI6MTU2MjgwMTQ2OCwic3ViIjoiIiwic2NvcGVzIjpbXX0.qesmcNqllMZvtVUBOsG0mhGvdbBcf9hTktky9JAyW8aWEFVm6DrE_tbp0L8a8cjsJcjMpFxLIuF3PNSDXlE-2HhlUABU1VcRwj5d351EexwW2QM_h5FWO1kD28QH_oJwnwz3Jnn1XqEyFlunPlTSlJHBCa6qf5HnRKJ_XkOwFSHL2EuY2G2f_GILn14LpDux_P4VJh4qrgyWBH03GcDcEJdVmAr4oIMeGlOAfAs-dbF_42KAQ-VDyxOZgBi_dMJrr_xrQUaK41wbJBxIbtp2jpLw17d_jamw1vsrgKOuwkfFAhp0iBps1OEN_5MvqKutlhkYYmeDaewPYVUprpph1w"
    data = JSON.parse(RestClient.get url, {
        :Authorization => "Bearer #{token}",
        :params => {

        }
      })

  end
end
