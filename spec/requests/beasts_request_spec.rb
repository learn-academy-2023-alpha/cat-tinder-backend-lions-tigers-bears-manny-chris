require 'rails_helper'

RSpec.describe "Beasts", type: :request do
    it "requires a name to create a beast" do
         # Create a test entry
         beast_params = {
            beast: {
                  age: 30,
                  description: 'Grrrrrreaaaaat match',
                  image: 'https://live.staticflickr.com/105/254081788_9c4335692d_b.jpg'
            }
      }

      # Send the request to the server
      post '/beasts', params: beast_params

      # Assure the expected error code (422)
      expect(response).to have_http_status(422)
      # Convert the JSON response into a Ruby Hash
      json = JSON.parse(response.body)
      # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
      expect(json['name']).to include "can't be blank"

      
    end
    it "requires an age to create a beast" do
      # Create a test entry
      beast_params = {
         beast: {
            name: 'Tony',
              
               description: 'Grrrrrreaaaaat match',
               image: 'https://live.staticflickr.com/105/254081788_9c4335692d_b.jpg'
         }
   }

   # Send the request to the server
   post '/beasts', params: beast_params

   # Assure the expected error code (422)
   expect(response).to have_http_status(422)
   # Convert the JSON response into a Ruby Hash
   json = JSON.parse(response.body)
   # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
   expect(json['age']).to include "can't be blank"
   
   
 end
 it "requires a description to create a beast" do
      # Create a test entry
      beast_params = {
         beast: {
            name: 'Tony',
               age: 30,
             
               image: 'https://live.staticflickr.com/105/254081788_9c4335692d_b.jpg'
         }
   }

   # Send the request to the server
   post '/beasts', params: beast_params

   # Assure the expected error code (422)
   expect(response).to have_http_status(422)
   # Convert the JSON response into a Ruby Hash
   json = JSON.parse(response.body)
   # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
   expect(json['description']).to include "can't be blank"
   
   
 end
 it "requires an image to create a beast" do
      # Create a test entry
      beast_params = {
         beast: {
               name: 'Tony',
               age: 30,
               description: 'Grrrrrreaaaaat match',
              
         }
   }

   # Send the request to the server
   post '/beasts', params: beast_params

   # Assure the expected error code (422)
   expect(response).to have_http_status(422)
   # Convert the JSON response into a Ruby Hash
   json = JSON.parse(response.body)
   # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
   expect(json['image']).to include "can't be blank"
   
   
 end
 it "requires description to be 10 characters" do
      # Create a test entry
      beast_params = {
         beast: {
               name: 'Tony',
               age: 30,
               description: 'match',
               image: 'https://live.staticflickr.com/105/254081788_9c4335692d_b.jpg'
              
         }
   }

   # Send the request to the server
   post '/beasts', params: beast_params

   # Assure the expected error code (422)
   expect(response).to have_http_status(422)
   # Convert the JSON response into a Ruby Hash
   json = JSON.parse(response.body)
   # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
   expect(json['description']).to include "is too short (minimum is 10 characters)"
   
   
 end
    it "requires valid data to update" do
        # Create a test entry
        beast_params = {
           beast: {
                 name: 'Tony',
                 age: 30,
                 description: 'Grrrrrreaaaaat match',
                 image: 'https://live.staticflickr.com/105/254081788_9c4335692d_b.jpg'
           }
     }

     # Send the request to the server
     post '/beasts', params: beast_params
        # Pull first entry from the model
        beast = Beast.last

        # Create new params to submit
        new_params = {
              beast: {
                    name: nil,
                    age: 31,
                    description: "match!",
                    image: nil
                 
              }
        }

        # Send the request to the server
        patch "/beasts/#{beast.id}", params: new_params

        new_beast = Beast.last


        # Assure the expected error code (422)
     expect(response).to have_http_status(422)
     # Convert the JSON response into a Ruby Hash
     json = JSON.parse(response.body)
     # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
     expect(json['description']).to include "is too short (minimum is 10 characters)"
     expect(json['image']).to include "can't be blank"
     expect(json['name']).to include "can't be blank"
   end
end