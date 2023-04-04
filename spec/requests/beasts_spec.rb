require 'rails_helper'

RSpec.describe "Beasts", type: :request do
      describe "GET /index" do
            it 'gets a list of beasts' do
                  # Create a test entry
                        Beast.create(
                              name: 'Tony',
                              age: 30,
                              description: 'Grrrrrreaaaaat match',
                              image: 'https://live.staticflickr.com/105/254081788_9c4335692d_b.jpg'
                        )

                        # Make a request
                        get '/beasts'

                        beast = JSON.parse(response.body)
                        expect(response).to have_http_status(200)
                        expect(beast.length).to eq 1
            end
      end

      describe 'POST/create' do
            it 'creates a beast' do
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

                  # Assure the request is successful
                  expect(response).to have_http_status(200)

                  # Pull first entry from the model
                  beast = Beast.first

                  # Assure the created beast has correct attributes
                  expect(beast.name).to eq 'Tony'
                  expect(beast.age).to eq 30
                  expect(beast.description).to eq 'Grrrrrreaaaaat match'
                  expect(beast.image).to eq 'https://live.staticflickr.com/105/254081788_9c4335692d_b.jpg'
            end
      end

      describe 'PATCH/update' do
            it 'updates a beast' do
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
                  beast = Beast.first

                  # Create new params to submit
                  new_params = {
                        beast: {
                              name: 'Tony',
                              age: 31,
                              description: "We're grrrrrrrreat to match!",
                              image: 'https://live.staticflickr.com/105/254081788_9c4335692d_b.jpg'
                        }
                  }

                  # Send the request to the server
                  patch "/beasts/#{beast.id}", params: new_params

                  # Assure the request is successful 
                  expect(response).to have_http_status(200)

                  # Pull latest entry from the model
                  new_beast = Beast.last

                  # Assure the created beast has correct attributes
                  expect(new_beast.name).to eq 'Tony'
                  expect(new_beast.age).to eq 31
                  expect(new_beast.description).to eq "We're grrrrrrrreat to match!"
                  expect(new_beast.image).to eq 'https://live.staticflickr.com/105/254081788_9c4335692d_b.jpg'
            end
      end

      describe 'DELETE/destroy' do
            it 'removes a beast' do
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

                  # Send the request to the server
                  delete "/beasts/#{beast.id}"

                  # Assure the request is successful 
                  expect(response).to have_http_status(200)

                  # Pull latest entry from the model
                  beasts = Beast.all

                  # Assure the created beast has correct attributes
                  expect(beasts).to be_empty
            end
      end
end