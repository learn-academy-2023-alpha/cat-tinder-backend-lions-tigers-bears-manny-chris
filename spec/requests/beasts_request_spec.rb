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
end