require 'rails_helper'

RSpec.describe Beast, type: :model do
  it "it is not valid without a name,age,description and image" do
    beast = Beast.create
    expect(beast.errors[:name]).to_not be_empty
    expect(beast.errors[:age]).to_not be_empty
    expect(beast.errors[:description]).to_not be_empty
    expect(beast.errors[:image]).to_not be_empty

  end

  it "has at least 10 characters in description" do
    beast = Beast.create name: 'Mufasa', age: 60, description: 'Dont go', image: 'https://lumiere-a.akamaihd.net/v1/images/607598d0230e6a00018e21b2-image_354b1b56.jpeg?region=0%2C48%2C1536%2C768'
    expect(beast.errors[:description]).to_not be_empty
  end
end
